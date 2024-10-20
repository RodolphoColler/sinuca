/*
  Warnings:

  - You are about to drop the `duomatches` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `singlematches` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropIndex
DROP INDEX `DuoPlayer_player_one_id_fkey` ON `duoplayer`;

-- DropIndex
DROP INDEX `DuoPlayer_player_two_id_fkey` ON `duoplayer`;

-- DropTable
DROP TABLE `duomatches`;

-- DropTable
DROP TABLE `singlematches`;

-- CreateTable
CREATE TABLE `SingleMatch` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `player_one_id` INTEGER NOT NULL,
    `player_two_id` INTEGER NOT NULL,
    `result` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DuoMatch` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `duo_one_id` INTEGER NOT NULL,
    `duo_two_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

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
