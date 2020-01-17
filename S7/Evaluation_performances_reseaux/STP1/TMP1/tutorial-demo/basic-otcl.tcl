Class mom

mom instproc greet {} {
    $self instvar age_
    puts "$age_ years old mom: How are you doing?"
}

Class kid -superclass mom

kid instproc greet {} {
    $self instvar age_
    puts "$age_ years old kid: What's up, dude?"
}

set a [new mom]
$a set age_ 45

set b [new kid]
$b set age_ 15

$a greet
$b greet