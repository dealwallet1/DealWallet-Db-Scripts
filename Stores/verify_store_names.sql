SELECT name FROM stores WHERE name IN (
'folk','GrowthSchool','Hello Bar','Hemingway','Jar','Magoosh','Jupiter','Pawrulz',
'Pluralsight','Runable','Stamped','Tata Play Fiber','testgorilla','Text Blaze','GitLab',
'Cafe Coffee Day','Mederma','Omen','Origin One','Roots And Herbs','Transteel','Vplak','Garbh Yatra');



DELETE FROM public.stores
WHERE name IN (
    'folk',
    'GrowthSchool',
    'Hello Bar',
    'Hemingway',
    'Jar',
    'Magoosh',
    'Jupiter',
    'Pawrulz',
    'Pluralsight',
    'Runable',
    'Stamped',
    'Tata Play Fiber',
    'testgorilla',
    'Text Blaze',
    'GitLab',
    'Cafe Coffee Day',
    'Mederma',
    'Omen',
    'Origin One',
    'Roots And Herbs',
    'Transteel',
    'Vplak',
    'Garbh Yatra'
)
RETURNING id, name;