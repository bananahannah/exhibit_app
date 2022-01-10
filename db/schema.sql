CREATE DATABASE exhibit_app;

-- remember to connect to the db before we create tables 
\c exhibit_app

CREATE TABLE work (
    id SERIAL PRIMARY KEY,
    name TEXT,
    year TEXT,
    image_url TEXT, 
    description TEXT,
    medium TEXT,
    designer TEXT
);

insert into 
work (name, year, image_url, description, medium, designer) 
values ('VIFM Annual Report', '2020', 'https://i.imgur.com/Y2xv5N0.jpg', 'Annual Report for the Victorial institure of Forensic Medicine', 'Digital, Adobe Suite etc', 'Hannah Carney');

insert into 
work (name, year, image_url, description, medium, designer) 
values ('Sawdust Bureau', '2019', 'https://i.imgur.com/SRjRJpk.jpg', '2019 catalogue for boutique furniture maker from Melbourne, Australia', 'Print, Adobe Suite', 'Hannah Carney');

insert into 
work (name, year, image_url, description, medium, designer) 
values ('DENFAIR Website | LIFE WORK', '2019', 'https://i.imgur.com/qeTFoOY.jpg', 'Website design and execution for DENFAIRs LIFE WORK theme', 'WordPress, Adobe Suite', 'Hannah Carney' );

insert into 
work (name, year, image_url, description, medium, designer) 
values ('through the lens.', '2018', 'https://i.imgur.com/a2rapxC.jpg','Photography print design book','Print, Adobe Suite', 'Hannah Carney');

insert into 
work (name, year, image_url, description, medium, designer) 
values ('Oxford & Foley', '2022', 'https://the-brandidentity.com/uploads/cache/articles/2021/07/houston-groups-identity-sydneys-oxford-foley-focuses-colourful-typographic-contrast/304/OxfordFoley-Houston-2-bc9e4.webp', 'Houston Groups identity for Sydneys Oxford & Foley focuses on colourful, typographic contrast', 'Digital, Adobe Suite etc', 'Houston Group');

insert into 
work (name, year, image_url, description, medium, designer) 
values ('Yerba Mate', '2021', 'https://the-brandidentity.com/uploads/cache/articles/2020/08/wedge-creates-practical-yet-eye-catching-packaging-canadian-yerba-mate-energy-drink/4389/MateLibre_1-bc9e4.webp', 'Wedge creates practical yet eye-catching packaging for a Canadian yerba mate energy drink', 'Packaging Design, Adobe Suite', 'Wedge');

insert into 
work (name, year, image_url, description, medium, designer) 
values ('Picanyol/s Rising Seas', '2022', 'https://the-brandidentity.com/uploads/cache/articles/2022/01/studio-ingrid-picanyols-rising-seas-campaign-uses-experimental-print-processes-as-an-urgent-cta/72084/RisingSeas-3-bc9e4.webp', 'Studio Ingrid Picanyol’s Rising Seas campaign uses experimental print processes as an urgent CTA', 'Print, Adobe Suite', 'Studio Ingrid' );

insert into 
work (name, year, image_url, description, medium, designer) 
values ('Foxtrot and The Violet Hour', '2021', 'https://the-brandidentity.com/uploads/cache/articles/2021/12/jim-kennellys-bottle-for-foxtrot-and-the-violet-hours-whisky-celebrates-the-history-of-chicago/70091/Foxtrot-JimKennelly-1-bc9e4.webp','Jim Kennelly/s bottle for Foxtrot and The Violet Hour/s whisky celebrates the history of Chicago','Print, Adobe Suite', 'Foxtrot');

