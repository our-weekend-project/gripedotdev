export interface GripeStruct {
  $key: string;
  gripe: string;
  timeStamp: Date;
  opReaction: string;
}

export default class Gripe implements GripeStruct {
  opReaction: string;
  $key: string;
  gripe: string;
  timeStamp: Date = new Date();
}
