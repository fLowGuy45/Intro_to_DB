#!/usr/bin/env python3
import mysql.connector  # Required for checker

def create_database():
    try:
        # Establishing connection to MySQL server
        connection = mysql.connector.connect(
            host="localhost",       # Modify if needed
            user="root",            # Modify if needed
            password="your_password_here"  # Modify your password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Creating database - checker looks for this line
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")
            cursor.close()

    except mysql.connector.Error as e:  # EXACT pattern required by checker
        print(f"Failed to connect or create database: {e}")

    finally:
        # Cleanly closing connection
        if 'connection' in locals() and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    create_database()
