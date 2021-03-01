CREATE TABLE contacts(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  email TEXT,
  address_id INTEGER
);

CREATE TABLE phones(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  phone TEXT,
  contact_id INTEGER,
  FOREIGN KEY(contact_id) REFERENCES contacts(id)
);

CREATE TABLE addresses(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  street TEXT,
  city TEXT,
  postCode TEXT,
  region TEXT,
  country TEXT,
  contact_id INTEGER,
  FOREIGN KEY(contact_id) REFERENCES contacts(id)
);

