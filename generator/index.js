import { light, mirage, dark } from 'ayu';
import * as fs from 'fs';

const currentDate = new Date();
let fileContent = '';
fileContent += `" File automatically generated on '${currentDate}'\n\n`;

fileContent += 'let g:ayu#palette = {\n';

fileContent += "\t\\\t'light': {\n";
fileContent += getFileContentFromColorStyle(light);
fileContent += '\t\\\t},\n';

fileContent += "\t\\\t'mirage': {\n";
fileContent += getFileContentFromColorStyle(mirage);
fileContent += '\t\\\t},\n';

fileContent += "\t\\\t'dark': {\n";
fileContent += getFileContentFromColorStyle(dark);
fileContent += '\t\\\t}\n';

fileContent += '\t\\}\n';

// TODO: Extended color palette
// TODO: Helper vimscript functions
// IDEA: Maybe these could be added into another file that's either separate or simply added to the end of this one

fs.writeFileSync('./ayu.vim', fileContent);

function getFileContentFromColorStyle(colorStyle) {
    let ret = '';
    for (let group in colorStyle) {
        for (let color in colorStyle[group]) {
            if (isClass(colorStyle[group][color])) { // Is a "Color" class
                const hex = colorStyle[group][color].hex('blend');
                ret += `\t\\\t\t'${group}_${color}': '${hex}',\n`;
            } else {
                for (let state in colorStyle[group][color]) {
                    const hex = colorStyle[group][color][state].hex('blend');
                    ret += `\t\\\t\t'${group}_${state}_${color}': '${hex}',\n`;
                }
            }
        }
    }

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
