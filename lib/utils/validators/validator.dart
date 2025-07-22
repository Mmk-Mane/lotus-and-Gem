class Validator {
  // Existing validations
  static String? validateNonEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  static String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return "Mobile number is required";
    }
    if (value.length != 10) {
      return "Mobile number must be 10 digits";
    }
    return null;
  }

  static String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Account number is required";
    }
    if (value.length > 16) {
      return "Account number cannot exceed 16 digits";
    }
    return null;
  }

  static String? validatePincode(String? value) {
    if (value == null || value.isEmpty) {
      return "Pincode is required";
    }
    if (value.length != 6) {
      return "Pincode must be 6 digits";
    }
    return null;
  }

  static String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return "Amount is required";
    }
    final amount = int.tryParse(value);
    if (amount == null || amount < 500) {
      return "Amount must be at least 500";
    }
    return null;
  }

  // New or updated validations
  static String? validateBankName(String? value) {
    return validateNonEmpty(value, "Bank Name");
  }

  static String? validateDateOfBirth(String? value) {
    if (value == null || value.isEmpty) {
      return "Date of Birth is required";
    }
    return null;
  }

  static String? validateIFSCCode(String? value) {
    if (value == null || value.isEmpty) {
      return "IFSC Code is required";
    }
    final ifscRegex = RegExp(r'^[A-Za-z]{4}\d{7}$');
    if (!ifscRegex.hasMatch(value)) {
      return "Enter a valid IFSC code";
    }
    return null;
  }

  static String? validateNomineeName(String? value) {
    return validateNonEmpty(value, "Nominee Name");
  }

  static String? validateNomineeRelation(String? value) {
    return validateNonEmpty(value, "Nominee Relation");
  }

  static String? validateProofType(String? value) {
    if (value == null || value == "Select ID Proof") {
      return "Please select an ID Proof type";
    }
    return null;
  }

  static String? validatePAN(String? value) {
    if (value == null || value.isEmpty) {
      return "PAN is required";
    }
    final panRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
    if (!panRegex.hasMatch(value)) {
      return "Enter a valid PAN number";
    }
    return null;
  }

  // Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    // Password should be at least 6 characters long
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

}
