
interface Reaction {
  reactionEmoji: string;
  numOfReactions: Number;
}
export interface GripeStruct {
  $key: string;
  gripe: string;
  timeStamp: Date;
  opReaction: string;
  otherReactions?: Reaction[];
}

export default class Gripe implements GripeStruct {
  opReaction: string;
  $key: string;
  gripe: string;
  timeStamp: Date = new Date();
  otherReactions?: Reaction[];
  hasOtherReactions(): boolean {
    return this.otherReactions.length > 0;
  }

}
