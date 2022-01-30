export interface InputCommand {
    type: InputCommandType;

    data?: FocusInputOptions | any;
}

export enum InputCommandType {
    FOCUS_INPUT = 'FOCUS_INPUT',
    DO_BLUR= 'DO_BLUR'
}

export interface FocusInputOptions {
    preventScroll: boolean;
}