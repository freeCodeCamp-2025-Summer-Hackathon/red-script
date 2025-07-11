import { BlobServiceClient } from "@azure/storage-blob";
import { env } from "../config/env";

const blobService = BlobServiceClient.fromConnectionString(
  env.AZURE_STORAGE_CONNECTION_STRING
);

const containerName = "skillswapimages";
const containerClient = blobService.getContainerClient(containerName);

export async function ensureContainer() {
  await containerClient.createIfNotExists({ access: "blob" });
}

export async function uploadAvatar(
  userId: string,
  bytes: Buffer,
  mime: string
) {
  const blobName = `${userId}/${Date.now()}`;
  const block = containerClient.getBlockBlobClient(blobName);

  await block.uploadData(bytes, {
    blobHTTPHeaders: { blobContentType: mime },
  });

  return block.url;
}
