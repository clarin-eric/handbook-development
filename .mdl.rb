all
rule "MD026", :punctuation => '.,;:!'

# Allow in-line HTML
#exclude_rule 'MD033'
rule 'MD033', :allowed_elements => 'link, if, todo, table, thead, tr, th, td, tbody, p, a, strong, br'