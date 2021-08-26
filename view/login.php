<html>
    <head>
        <title>Login</title>
    </head>
    <body>

        <form action="../model/models.php" method="post">

            <!-- username -->
            <p>
                <label>Username</label>
                <input type="text" name="username" id="username" required="required"/>
            </p>
            <br>

            <!-- password -->
            <p>
                <label>Password</label>
                <input type="password" name="password" id="password" required="required"/>
            </p>
            <br>

            <!-- buttons -->
            <p>
                <button type="submit"><span>Login</span></button>
                <button type="reset"><span>Cancel</span></button>
            </p>

        </form>

    </body>
</html>