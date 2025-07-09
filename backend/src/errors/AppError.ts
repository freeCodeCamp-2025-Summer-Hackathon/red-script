export class AppError extends Error {
  constructor(
    public readonly status: number,
    message: string = "Unexpected error"
  ) {
    super(message);
    Error.captureStackTrace(this, this.constructor);
  }
}
