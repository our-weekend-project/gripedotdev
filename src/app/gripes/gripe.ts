export interface GripeStruct {
  $key: string;
  gripe: string;
  timeStamp: Date;
}

export default class Gripe implements GripeStruct {
  $key: string;
  gripe: string;
  timeStamp: Date = new Date();
}
