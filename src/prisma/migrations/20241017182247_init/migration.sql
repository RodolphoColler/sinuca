/*
  Warnings:

  - You are about to drop the column `result` on the `duoplayer` table. All the data in the column will be lost.
  - Added the required column `result` to the `DuoMatch` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `DuoMatch_duo_one_id_fkey` ON `duomatch`;

-- DropIndex
DROP INDEX `DuoMatch_duo_two_id_fkey` ON `duomatch`;

-- DropIndex
DROP INDEX `DuoPlayer_player_one_id_fkey` ON `duoplayer`;

-- DropIndex
DROP INDEX `DuoPlayer_player_two_id_fkey` ON `duoplayer`;

-- DropIndex
DROP INDEX `SingleMatch_player_one_id_fkey` ON `singlematch`;

-- DropIndex
DROP INDEX `SingleMatch_player_two_id_fkey` ON `singlematch`;

-- AlterTable
ALTER TABLE `duomatch` ADD COLUMN `result` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `duoplayer` DROP COLUMN `result`;

-- AddForeignKey
ALTER TABLE `SingleMatch` ADD CONSTRAINT `SingleMatch_player_one_id_fkey` FOREIGN KEY (`player_one_id`) REFERENCES `Player`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SingleMatch` ADD CONSTRAINT `SingleMatch_player_two_id_fkey` FOREIGN KEY (`player_two_id`) REFERENCES `Player`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DuoPlayer` ADD CONSTRAINT `DuoPlayer_player_one_id_fkey` FOREIGN KEY (`player_one_id`) REFERENCES `Player`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DuoPlayer` ADD CONSTRAINT `DuoPlayer_player_two_id_fkey` FOREIGN KEY (`player_two_id`) REFERENCES `Player`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DuoMatch` ADD CONSTRAINT `DuoMatch_duo_one_id_fkey` FOREIGN KEY (`duo_one_id`) REFERENCES `DuoPlayer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DuoMatch` ADD CONSTRAINT `DuoMatch_duo_two_id_fkey` FOREIGN KEY (`duo_two_id`) REFERENCES `DuoPlayer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
