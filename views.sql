CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `low_activity_customers` AS select count(0) AS `purchase_count` from `orders` where (`orders`.`orders_purchasedate` < (now() - interval 1 month)) group by `orders`.`customers_id` having (`purchase_count` < 4);

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `low_sale_volume_products` AS select sum(`orderitems`.`quantity`) AS `purchase_count` from (`orderitems` join `orders` on((`orderitems`.`orders_id` = `orders`.`orders_id`))) where (`orders`.`orders_purchasedate` < (now() - interval 1 month)) group by `orderitems`.`products_id`,`orderitems`.`suppliers_id` having (`purchase_count` < 10);

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `most_wished_for_products` AS select max(`t1`.`wishcount`) AS `wishcount`,`t1`.`products_id` AS `products_id`,`ptc`.`categories_id` AS `categories_id` from ((select `wishlists`.`products_id` AS `products_id`,count(0) AS `wishcount` from `wishlists` group by `wishlists`.`products_id`) `t1` join `products_to_categories` `ptc` on((`t1`.`products_id` = `ptc`.`products_id`))) group by `ptc`.`categories_id`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `products_to_restock` AS select `products`.`products_id` AS `products_id`,`products`.`products_name` AS `products_name`,`products`.`products_price` AS `products_price`,`products`.`products_stock` AS `products_stock`,`products`.`products_description` AS `products_description`,`products`.`products_restock_level` AS `products_restock_level`,`products`.`products_lastsold` AS `products_lastsold`,`products`.`products_sale_flag` AS `products_sale_flag`,`products`.`products_active` AS `products_active`,`products`.`suppliers_id` AS `suppliers_id` from `products` where (`products`.`products_stock` <= `products`.`products_restock_level`);