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
        duo_player: {
          include: { player_one: true, player_two: true }
        },
        duo_player_two: {
          include: { player_one: true, player_two: true }
        }
    } });

    return res.status(200).json({ duoMatch });
  } catch (error) {
    return next(error);
  }
}

export async function readByDate(req: Request, res: Response, next: NextFunction): Promise<any>  {
  try {
    const { startDate, endDate } = req.params as any;

    const [startYear, startMonth, startDay] = startDate.split('-');

    const [year, month, day] = endDate.split('-');

    const singleMatch = await prisma.duoMatch.findMany({
      include: { 
        duo_player: {
          include: { player_one: true, player_two: true }
        },
      },
      where: {
        date: {
          gte: new Date(`${startYear}-${startMonth}-${startDay}`),
          lte: new Date(`${year}-${month}-${day}`),
        },
      },
    });

    return res.status(200).json({ singleMatch });
  } catch (error) {
    return next(error);
  }
}


