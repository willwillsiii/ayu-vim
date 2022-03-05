import { light, mirage, dark } from 'ayu';
import * as fs from 'fs';

// TODO: Create the same structure as what was used before. It was simpler to
// read and less verbose than this one.

const currentDate = new Date();
let fileContent = `" File automatically generated on '${currentDate}'
let g:ayu#palette = {
    \\    'light': {
${getFileContentFromColorStyle(light)}
    \\    },
    \\    'mirage': {
${getFileContentFromColorStyle(mirage)}
    \\    },
    \\    'dark': {
${getFileContentFromColorStyle(dark)}
    \\    }
    \\}

`;

fileContent += fs.readFileSync('./ayu.extended.vim');

fs.writeFileSync('./ayu.vim', fileContent);

function getFileContentFromColorStyle(colorStyle) {
    let ret = '';
    for (let group in colorStyle) {
        for (let color in colorStyle[group]) {
            if (isClass(colorStyle[group][color])) { // Is a "Color" class
                const hex = colorStyle[group][color].hex('blend');
                ret += `    \\        '${group}_${color}': '${hex}',\n`;
            } else {
                for (let state in colorStyle[group][color]) {
                    const hex = colorStyle[group][color][state].hex('blend');
                    ret += `    \\        '${group}_${state}_${color}': '${hex}',\n`;
                }
            }
        }
    }

    ret = ret.slice(0, ret.length - 1);

    return ret;
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
