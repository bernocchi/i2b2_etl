select *
from    clarity.allergy_reactions a
inner join 
        clarity.zc_reaction B
on      a.REACTION_C = B.REACTION_C


SELECT * FROM clarity.zc_reaction B