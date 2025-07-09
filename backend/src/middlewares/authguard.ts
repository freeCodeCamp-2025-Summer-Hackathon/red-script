import { RequestHandler } from 'express';
import { verify } from '../utils/jwt';
import type { JwtPayload } from 'jsonwebtoken';

export const authGuard: RequestHandler<
  any, any, any, any, { user: JwtPayload }
> = (req, res, next) => {
  const header = req.headers.authorization?.split(' ');
  if (!header || header[0] !== 'Bearer' || !header[1]) {
    res.sendStatus(401);
    return;
  }

  try {
    res.locals.user = verify(header[1]);
    next();
  } catch {
    res.sendStatus(403);
  }
};