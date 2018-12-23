TXSelection acts a selection data holder for TXRay. See description of TSelection.

Same as TSelection except we ensure that we never have access to an object that is inside of an Island. TXSelection (eXternal Selection) either has a copy or a has a reference ID to the original object.