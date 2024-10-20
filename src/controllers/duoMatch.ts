import { Response, Request, NextFunction } from 'express';
import prisma from "../prisma/prisma"


export async function create(req: Request, res: Response, next: NextFunction): Promise<any>  {
  try {
    const { duo_one_id, duo_two_id, result } = req.body;

    const duoMatch = await prisma.duoMatch.create({ 
      data: {
        result,
        duo_player: { connect: { id: duo_one_id } },
        duo_player_two: { connect: { id: duo_two_id } },
        // duo_one_id: {connect : { id: duo_two_id }}
      } 
    });

    return res.status(201).json({ duoMatch });
  } catch (error) {
    return next(error);
  }
}

export async function read(_req: Request, res: Response, next: NextFunction): Promise<any>  {
  try {
    const duoMatch = await prisma.duoMatch.findMany({ 
      include: { 
        // duo_player: true,
        // duo_player_two: true,
        duo_player: {
          include: { player_one: true, player_two: true }
          // include: {  }
        }
    } });

    return res.status(200).json({ duoMatch });
  } catch (error) {
    return next(error);
  }
}
