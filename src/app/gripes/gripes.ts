import {GripeStruct} from './gripe';

// tslint:disable: max-line-length
// disabling max-line-length for file cause static date
export class Gripes {
    staticGripes: GripeStruct[] = [];
    constructor() {
        const date = new Date();
        this.staticGripes.push(
            {
                $key: '1',
                gripe: 'my life is nothing but gripes',
                timeStamp: date,
                opReaction: '🗿'
            },
            {
                $key: '2',
                gripe: `there has to be a better patching process than:
                1) Do work
                2) Merge to dev
                3) verify it works on dev
                4) blindly cherry-pick to staging
                5) hope it works once a new staging post happens
                `,
                timeStamp: date,
                opReaction: '🤦'
            },
            {
                $key: '3',
                gripe: 'New Android continues to disappoint',
                timeStamp: date,
                opReaction: '👌',
                otherReactions: [
                    {reactionEmoji: '💯',
                    numOfReactions: 12 }
                ]
            },
            {
                $key: '4',
                gripe: `The python tools for VSCode are pretty good, but the linter only runs on the current file when you save the current file, so you can't refactor things by:
                1. Deleting the thing
                2. Resolving the errors
                `,
                timeStamp: date,
                opReaction: '🕴',
                otherReactions: [
                    {   reactionEmoji: '💯',
                        numOfReactions: 100 },
                    {
                        reactionEmoji: '🗿',
                        numOfReactions: 9001
                    }
                ]
            },
            {
                $key: '4',
                gripe: `Who the fuck thought it would be a good idea to nest all java projects in at minimum 3 folder`,
                timeStamp: date,
                opReaction: '😡'
            }
        );
    }

    getGripes(): GripeStruct[] {
        return this.staticGripes;
    }
    addGripe(gripe: GripeStruct): void {
        this.staticGripes.push(gripe);
    }
}
