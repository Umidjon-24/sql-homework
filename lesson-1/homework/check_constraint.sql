USE lesson1;

CREATE TABLE account(
	account_id INT PRIMARY KEY,
	balance DECIMAL CHECK (balance>=0),
	account_type VARCHAR(50) CHECK (account_type IN ('Saving', 'Checking'))
);

SELECT name
FROM sys.check_constraints
WHERE parent_object_id = OBJECT_ID('account');

ALTER TABLE account
DROP CONSTRAINT [CK__account__balance__46E78A0C];
ALTER TABLE account
DROP CONSTRAINT [CK__account__account__47DBAE45];

ALTER TABLE account
ADD CONSTRAINT chk_balance_positive CHECK (balance >= 0);
ALTER TABLE account
ADD CONSTRAINT chk_account_type_valid CHECK (account_type IN ('Saving', 'Checking'));

