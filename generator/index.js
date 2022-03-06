import { light, mirage, dark } from 'ayu';
import * as fs from 'fs';

const currentDate = new Date();
let fileContent = `" File automatically generated on '${currentDate}'\n\n`;

fileContent += 'let g:ayu#palette = {}\n';

for (let group in light) {
    for (let color in light[group]) {
        if (isClass(light[group][color])) { // Is a "Color" class
            const letStatement = `let g:ayu#palette['${group}_${color}']`.padEnd(50, ' ');
            fileContent += `${letStatement} = ${getColorDict(group, color)}\n`;
        } else {
            for (let state in light[group][color]) {
                const letStatement = `let g:ayu#palette['${group}_${color}_${state}']`.padEnd(50, ' ');
                fileContent += `${letStatement} = ${getColorDict(group, color, state)}\n`;
            }
        }
    }
}

fileContent += '\n';
fileContent += fs.readFileSync('./ayu.extended.vim');

fs.writeFileSync('../autoload/ayu.vim', fileContent);

function getColorDict(group, color, state) {
    let lightHex, mirageHex, darkHex;
    if (typeof state === 'undefined') {
        // TODO: Blend is nice, but there are multiple backgrounds possible, it
        // is possible that we do not use the same background in vim.
        // Maybe we would need to blend it with the multiple possible
        // backgrounds.
        lightHex = light[group][color].hex('blend');
        mirageHex = mirage[group][color].hex('blend');
        darkHex = dark[group][color].hex('blend');
    } else {
        lightHex = light[group][color][state].hex('blend');
        mirageHex = mirage[group][color][state].hex('blend');
        darkHex = dark[group][color][state].hex('blend');
    }

    return `{'light': '${lightHex}', 'mirage': '${mirageHex}', 'dark': '${darkHex}'}`;
}

function isClass(obj) {
    const isCtorClass = obj.constructor
        && obj.constructor.toString().substring(0, 5) === 'class'
    if (obj.prototype === undefined) {
        return isCtorClass
    }
    const isPrototypeCtorClass = obj.prototype.constructor
        && obj.prototype.constructor.toString
        && obj.prototype.constructor.toString().substring(0, 5) === 'class'
    return isCtorClass || isPrototypeCtorClass
}
