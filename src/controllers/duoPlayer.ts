import { Response, Request, NextFunction } from 'express';
import prisma from "../prisma/prisma"

export async function create(req: Request, res: Response, next: NextFunction): Promise<any>  {
  try {
    const { player_one_id, player_two_id } = req.body;

    const duoPlayer = await prisma.duoPlayer.create({
      data: {
        player_one: { connect: { id: player_one_id } },
        player_two: { connect: { id: player_two_id } },
      }
    })

    return res.status(201).json({ duoPlayer });
  } catch (error) {
    return next(error);
  }
}

export async function read(_req: Request, res: Response, next: NextFunction): Promise<any>  {
  try {
    const duoPlayer = await prisma.duoPlayer.findMany({
      include: {
        player_one: true,
        player_two: true,
      }
    });

    return res.status(201).json({ duoPlayer });
  } catch (error) {
    return next(error);
  }
}