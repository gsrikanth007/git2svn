function select_all(nod)
{
    var rgInputs = nod.parentNode.getElementsByTagName('input');
    var fOn = nod.value == 'Select all';
    for (var ix in rgInputs) {
        if (rgInputs[ix]['type'] == 'checkbox' && rgInputs[ix].parentNode['className'] == 'item') {
            rgInputs[ix]['checked'] = rgInputs[ix]['disabled'] = fOn;
        }
    }

    if (fOn) {
        nod.value = 'Deselect all';
    } else {
        nod.value = 'Select all';
    }
}
