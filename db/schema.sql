CREATE DATABASE exhibit_app;

-- remember to connect to the db before we create tables 
\c exhibit_app

CREATE TABLE work (
    id SERIAL PRIMARY KEY,
    name TEXT,
    year TEXT,
    image_url TEXT, 
    description TEXT,
    medium TEXT
);

insert into 
work (name, year, image_url, description, medium) 
values ('VIFM Annual Report', '2020', 'https://i.imgur.com/Y2xv5N0.jpg', 'Annual Report for the Victorial institure of Medicine. By: Studio name goes here', 'Digital, Adobe Suite etc');

insert into 
work (name, year, image_url, description, medium) 
values ('Sawdust Bureau', '2019', 'https://i.imgur.com/SRjRJpk.jpg', '2019 annual report for boutique furniture maker from Melbourne, Australia', 'Print, Adobe Suite');

insert into 
work (name, year, image_url, description, medium) 
values ('DENFAIR Website | LIFE WORK', '2019', 'https://i.imgur.com/qeTFoOY.jpg', 'Website design and execution for DENFAIRs LIFE WORK theme', 'WordPress, Adobe Suite' );

insert into 
work (name, year, image_url, description, medium) 
values ('through the lens.', '2018', 'https://i.imgur.com/a2rapxC.jpg','Photography print design book','Print, Adobe Suite');

