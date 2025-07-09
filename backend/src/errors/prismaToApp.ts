import { PrismaClientKnownRequestError } from "@prisma/client/runtime/library";
import { AppError } from "./AppError";

const codeMap: Record<string, { status: number; message: string }> = {
  P2002: { status: 409, message: "Credentials invalid" }
  // We can place other prisma errors here
};

export function prismaToApp(err: unknown): unknown {
  if (err instanceof PrismaClientKnownRequestError) {
    const match = codeMap[err.code];
    if (match) {
      return new AppError(match.status, match.message);
    }
  }
  return err;
}
