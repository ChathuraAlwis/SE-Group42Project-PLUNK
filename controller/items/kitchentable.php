<!DOCTYPE html>
<html>
    <body>

        <div class="form2">
            <h2 class="center-text">Kichen items table</h2>
            <div class="table">
                <table id="table_id" class="table table-striped" >
                    <thead class="thead">
                    <tr>
                        <th>Item ID</th>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Category</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($kitchen_item as $kitchen_item) { ?>
                        <tr>
                            <td><?php echo htmlspecialchars($kitchen_item["Item_ID"]);?></td>
                            <td><?php echo htmlspecialchars($kitchen_item["Name"]);?></td>
                            <td> <?php echo htmlspecialchars($kitchen_item["Price"]);?></td>
                            <td><?php echo htmlspecialchars($kitchen_item["Quantity"]);?></td>
                            <td><?php echo htmlspecialchars($kitchen_item["Category"]);?></td>
                        </tr>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

