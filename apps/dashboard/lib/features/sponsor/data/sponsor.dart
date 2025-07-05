import 'package:flutter/foundation.dart';

@immutable
sealed class Sponsor {
  const Sponsor({
    required this.id,
    required this.name,
    required this.slug,
    required this.logoUrl,
  });

  final String id;
  final String name;
  final String slug;
  final Uri logoUrl;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is Sponsor &&
        id == other.id &&
        name == other.name &&
        slug == other.slug &&
        logoUrl == other.logoUrl;
  }

  @override
  int get hashCode => Object.hash(id, name, slug, logoUrl);
}

@immutable
sealed class CompanySponsor extends Sponsor {
  const CompanySponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    required this.description,
    required this.websiteUrl,
  });

  final String description;
  final Uri websiteUrl;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is CompanySponsor &&
        id == other.id &&
        name == other.name &&
        slug == other.slug &&
        logoUrl == other.logoUrl &&
        description == other.description &&
        websiteUrl == other.websiteUrl;
  }

  @override
  int get hashCode =>
      Object.hash(id, name, slug, logoUrl, description, websiteUrl);
}

@immutable
sealed class NamingRight {
  const NamingRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is NamingRight;
  }

  @override
  int get hashCode => identityHashCode(this);
}

@immutable
final class NotAppliedNamingRight extends NamingRight {
  const NotAppliedNamingRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is NotAppliedNamingRight;
  }

  @override
  int get hashCode => identityHashCode(this);
}

@immutable
sealed class AppliedNamingRight extends NamingRight {
  const AppliedNamingRight({
    required this.name,
  });

  final String name;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is AppliedNamingRight && name == other.name;
  }

  @override
  int get hashCode => name.hashCode;
}

@immutable
final class HallNamingRight extends AppliedNamingRight {
  const HallNamingRight({
    required super.name,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is HallNamingRight && name == other.name;
  }

  @override
  int get hashCode => name.hashCode;
}

@immutable
final class RoomNamingRight extends AppliedNamingRight {
  const RoomNamingRight({
    required super.name,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is RoomNamingRight && name == other.name;
  }

  @override
  int get hashCode => name.hashCode;
}

@immutable
final class PlatinumSponsor extends CompanySponsor {
  const PlatinumSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    required super.description,
    required super.websiteUrl,
    this.namingRight = const NotAppliedNamingRight(),
    this.namePlate = false,
    this.scholarship = false,
  });

  final NamingRight namingRight;
  final bool namePlate;
  final bool scholarship;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is PlatinumSponsor &&
        id == other.id &&
        name == other.name &&
        slug == other.slug &&
        logoUrl == other.logoUrl &&
        description == other.description &&
        websiteUrl == other.websiteUrl &&
        namingRight == other.namingRight &&
        namePlate == other.namePlate &&
        scholarship == other.scholarship;
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    slug,
    logoUrl,
    description,
    websiteUrl,
    namingRight,
    namePlate,
    scholarship,
  );
}

@immutable
final class GoldSponsor extends CompanySponsor {
  const GoldSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    required super.description,
    required super.websiteUrl,
    this.namingRight,
    this.namePlate = false,
    this.scholarship = false,
  });

  final NamingRight? namingRight;
  final bool namePlate;
  final bool scholarship;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is GoldSponsor &&
        id == other.id &&
        name == other.name &&
        slug == other.slug &&
        logoUrl == other.logoUrl &&
        description == other.description &&
        websiteUrl == other.websiteUrl &&
        namingRight == other.namingRight &&
        namePlate == other.namePlate &&
        scholarship == other.scholarship;
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    slug,
    logoUrl,
    description,
    websiteUrl,
    namingRight,
    namePlate,
    scholarship,
  );
}

@immutable
final class SilverSponsor extends CompanySponsor {
  const SilverSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    required super.description,
    required super.websiteUrl,
    this.namingRight,
    this.namePlate = false,
    this.lunchSponsor = false,
    this.scholarship = false,
  });

  final NamingRight? namingRight;
  final bool namePlate;
  final bool lunchSponsor;
  final bool scholarship;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is SilverSponsor &&
        id == other.id &&
        name == other.name &&
        slug == other.slug &&
        logoUrl == other.logoUrl &&
        description == other.description &&
        websiteUrl == other.websiteUrl &&
        namingRight == other.namingRight &&
        namePlate == other.namePlate &&
        lunchSponsor == other.lunchSponsor &&
        scholarship == other.scholarship;
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    slug,
    logoUrl,
    description,
    websiteUrl,
    namingRight,
    namePlate,
    lunchSponsor,
    scholarship,
  );
}

@immutable
final class BronzeSponsor extends CompanySponsor {
  const BronzeSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    required super.description,
    required super.websiteUrl,
    this.namePlate = false,
    this.lunchSponsor = false,
    this.scholarship = false,
  });

  final bool namePlate;
  final bool lunchSponsor;
  final bool scholarship;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is BronzeSponsor &&
        id == other.id &&
        name == other.name &&
        slug == other.slug &&
        logoUrl == other.logoUrl &&
        description == other.description &&
        websiteUrl == other.websiteUrl &&
        namePlate == other.namePlate &&
        lunchSponsor == other.lunchSponsor &&
        scholarship == other.scholarship;
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    slug,
    logoUrl,
    description,
    websiteUrl,
    namePlate,
    lunchSponsor,
    scholarship,
  );
}

@immutable
final class OtherSponsor extends CompanySponsor {
  const OtherSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    required super.description,
    required super.websiteUrl,
    this.scholarship = false,
  });

  final bool scholarship;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is OtherSponsor &&
        id == other.id &&
        name == other.name &&
        slug == other.slug &&
        logoUrl == other.logoUrl &&
        description == other.description &&
        websiteUrl == other.websiteUrl &&
        scholarship == other.scholarship;
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    slug,
    logoUrl,
    description,
    websiteUrl,
    scholarship,
  );
}

@immutable
final class IndividualSponsor extends Sponsor {
  const IndividualSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    required this.enthusiasm,
    required this.websiteUrl,
  });

  final String enthusiasm;
  final Uri? websiteUrl;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is IndividualSponsor &&
        id == other.id &&
        name == other.name &&
        slug == other.slug &&
        logoUrl == other.logoUrl &&
        enthusiasm == other.enthusiasm &&
        websiteUrl == other.websiteUrl;
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    slug,
    logoUrl,
    enthusiasm,
    websiteUrl,
  );
}
