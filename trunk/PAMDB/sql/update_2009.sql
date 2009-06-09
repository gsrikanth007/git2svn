INSERT INTO `val_sector`(`sector`) VALUES('LULUCF');
INSERT INTO `val_with_or_with_additional_measure`(`with_or_with_additional_measure`, `with_or_with_additional_measure_output`) VALUES('WEM + WAM', 'WEM + WAM');
ALTER TABLE `val_related_ccpm` ADD `md5` VARCHAR( 255 ) NOT NULL;
UPDATE `val_related_ccpm` SET `md5` = MD5(`related_ccpm`) WHERE 1;
ALTER TABLE `val_related_ccpm` ADD UNIQUE (`md5`);
