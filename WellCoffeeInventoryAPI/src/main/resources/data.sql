INSERT IGNORE INTO category
VALUES
-- Fields:
-- (id, date, name)
(1, 081224, "Coffee"),
(2, 081224, "Food"),
(3, 081224, "Paper Products"),
(4, 081224, "Miscellaneous");

ALTER TABLE item MODIFY image LONGTEXT;

INSERT IGNORE INTO item
VALUES
-- Fields:
-- (category_id, id, minQuantity, price, quantity, name, amazonProductId, comment, description, location, image)
(1, 1, 23, 5.99, 55, "Espresso Beans", "", "Astute comment 1", "Dark and tasty", "Shelf 1A", ""),
(1, 2, 12, 12.99, 10, "Highlander Grog Beans", "", "Astute comment 2", "There can only be one...", "Shelf 1A", ""),
(1, 3, 13, 15.99, 8, "Hazelnut Beans", "", "Astute comment 3", "Robust with a nutty finish.", "Shelf 1A", ""),
(2, 4, 14, 15.99, 15, "Cinnamon Rolls", "", "Astute comment 4", "A sweet staple.", "Shelf 2A", ""),
(2, 5, 15, 24.99, 18, "Strawberry Scones", "", "Astute comment 5", "There is fruit in it so it HAS to be healthy", "Shelf 2A", ""),
(3, 6, 16, 24.99, 20, "Straws", "", "Astute comment 6", "500 count", "Shelf 3A", ""),
(3, 7, 17, 19.99, 30, "Spoons", "", "Astute comment 7", "300 count", "Shelf 3A", ""),
(4, 8, 18, 12.99, 4, "Clorox Wipes", "", "Astute comment 8", "Keep it clean", "Shelf 4A", ""),
(4, 9, 19, 20.99, 8, "Light Bulbs", "", "Astute comment 9", "Keep it bright", "Shelf 4A", "");

INSERT IGNORE INTO account
VALUES
(1, "mike@aol.com", "Mike", "Myers", "cars", "Employee"),
(2, "chris@aol.com", "Chris", "Farley", "boats", "Employee"),
(3, "will@aol.com", "Will", "Ferrell", "motorcycles", "Employee"),
(4, "chevy@aol.com", "Chevy", "Chase", "bicycles", "Manager");

INSERT IGNORE INTO invoice
VALUES
-- Fields:
--(id, invoice_date, invoice_number, vendor, account_id)
(1, 240812, 105, "Java Time", 1),
(2, 240812, 159, "The Coffee Friends", 1),
(3, 240812, 250, "Beans On Demand", 2),
(4, 240812, 490, "Half & Half Priced Warehouse", 3);

INSERT IGNORE INTO invoice_item
VALUES
-- Fields:
--(invoice_id, item_id)
(1,1),
(1,2),
(1,6),
(2,2),
(2,4),
(3,4),
(3,2),
(3,9),
(4,3),
(4,8),
(4,7),
(4,4);

INSERT IGNORE INTO ordered_item
VALUES
-- Fields:
--(id, item_cost, item_id, quantityOrdered)
(1,5.99,1,4),
(2,12.99,2,2),
(3,24.99,6,9),
(4,12.99,2,8),
(5,15.99,4,1),
(6,15.99,4,5),
(7,12.99,2,3),
(8,20.99,9,1),
(9,15.99,3,2),
(10,12.99,8,3),
(11,19.99,7,20),
(12,15.99,4,58);

INSERT IGNORE INTO invoice_ordered_items
VALUES
-- Fields:
--(invoice_id, ordered_items_id)
(1,1),
(1,2),
(1,3),
(2,4),
(2,5),
(3,6),
(3,7),
(3,8),
(4,9),
(4,10),
(4,11),
(4,12);