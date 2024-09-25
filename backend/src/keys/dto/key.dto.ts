export class CreateKeyDto {
  regId: number;
  identityPublicKey: Buffer;
  preKeyIds: number[];
  preKeys: Buffer[];
  signedId: number;
  signedPublicKey: Buffer;
  signedKeySignature: Buffer;
}

export class KeyDto extends CreateKeyDto {
  email: string;
}
