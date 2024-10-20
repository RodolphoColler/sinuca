import { Response, Request, NextFunction } from 'express';
import prisma from "../prisma/prisma"


export async function create(req: Request, res: Response, next: NextFunction): Promise<any>  {
  try {
    const { player_one_id, player_two_id, result } = req.body;

    const singleMatch = await prisma.singleMatch.create({ 
      data: {
        result,
        player_one: { connect: { id: player_one_id } },
        player_two: { connect: { id: player_two_id } },
      } 
    });

    return res.status(201).json({ singleMatch });
  } catch (error) {
    return next(error);
  }
}

export async function read(_req: Request, res: Response, next: NextFunction): Promise<any>  {
  try {

    const singleMatch = await prisma.singleMatch.findMany({
      include: {
        player_one: true,
        player_two: true,
      }
    });

    return res.status(200).json({ singleMatch });
  } catch (error) {
    return next(error);
  }
}

