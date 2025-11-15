import 'package:flutter/foundation.dart';

@immutable
sealed class Sponsor {
  const Sponsor({
    required this.id,
    required this.logoUrl,
  });

  final String id;
  final Uri logoUrl;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is Sponsor && id == other.id && logoUrl == other.logoUrl;
  }

  @override
  int get hashCode => Object.hash(id, logoUrl);
}

@immutable
sealed class CompanySponsor extends Sponsor {
  const CompanySponsor({
    required super.id,
    required super.logoUrl,
    required this.name,
    required this.slug,
    required this.prText,
    required this.websiteUrl,
    this.xAccount,
    this.scholarship = false,
  });

  final String name;
  final String slug;
  final String prText;
  final Uri websiteUrl;
  final String? xAccount;
  final bool scholarship;

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
        prText == other.prText &&
        websiteUrl == other.websiteUrl &&
        xAccount == other.xAccount &&
        scholarship == other.scholarship;
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    slug,
    logoUrl,
    prText,
    websiteUrl,
    xAccount,
    scholarship,
  );

  bool get isNamingRights => switch (this) {
    final NamingRightMixin sponsor => () {
      final namingRight = sponsor.namingRight;
      return namingRight is AppliedNamingRight;
    }(),
    BronzeSponsor() || ToolSponsor() || OtherSponsor() => false,
  };

  bool get isNameplate => switch (this) {
    final NamePlateMixin sponsor => () {
      return sponsor.namePlate;
    }(),
    ToolSponsor() || OtherSponsor() => false,
  };

  bool get isLunch => switch (this) {
    final LunchMixin sponsor => () {
      return sponsor.lunchSponsor;
    }(),
    PlatinumSponsor() ||
    GoldSponsor() ||
    ToolSponsor() ||
    OtherSponsor() => false,
  };
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
sealed class BasicSponsor extends CompanySponsor {
  const BasicSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    required super.prText,
    required super.websiteUrl,
    super.xAccount,
    super.scholarship,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is BasicSponsor &&
        id == other.id &&
        name == other.name &&
        slug == other.slug &&
        logoUrl == other.logoUrl &&
        prText == other.prText &&
        websiteUrl == other.websiteUrl &&
        xAccount == other.xAccount &&
        scholarship == other.scholarship;
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    slug,
    logoUrl,
    prText,
    websiteUrl,
    xAccount,
    scholarship,
  );
}

@immutable
final class PlatinumSponsor extends BasicSponsor
    with NamingRightMixin, NamePlateMixin {
  const PlatinumSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    required super.prText,
    required super.websiteUrl,
    super.xAccount,
    super.scholarship,
    this.namingRight = const NotAppliedNamingRight(),
    this.namePlate = false,
  });

  @override
  final NamingRight namingRight;
  @override
  final bool namePlate;

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
        prText == other.prText &&
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
    prText,
    websiteUrl,
    namingRight,
    namePlate,
    scholarship,
  );
}

@immutable
final class GoldSponsor extends BasicSponsor
    with NamingRightMixin, NamePlateMixin {
  const GoldSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    required super.prText,
    required super.websiteUrl,
    super.xAccount,
    super.scholarship,
    this.namingRight = const NotAppliedNamingRight(),
    this.namePlate = false,
  });

  @override
  final NamingRight namingRight;
  @override
  final bool namePlate;

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
        prText == other.prText &&
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
    prText,
    websiteUrl,
    namingRight,
    namePlate,
    scholarship,
  );
}

@immutable
final class SilverSponsor extends BasicSponsor
    with NamingRightMixin, NamePlateMixin, LunchMixin {
  const SilverSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    required super.prText,
    required super.websiteUrl,
    super.xAccount,
    super.scholarship,
    this.namingRight = const NotAppliedNamingRight(),
    this.namePlate = false,
    this.lunchSponsor = false,
  });

  @override
  final NamingRight namingRight;
  @override
  final bool namePlate;
  @override
  final bool lunchSponsor;

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
        prText == other.prText &&
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
    prText,
    websiteUrl,
    namingRight,
    namePlate,
    lunchSponsor,
    scholarship,
  );
}

@immutable
final class BronzeSponsor extends BasicSponsor with NamePlateMixin, LunchMixin {
  const BronzeSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    required super.prText,
    required super.websiteUrl,
    super.xAccount,
    super.scholarship,
    this.namePlate = false,
    this.lunchSponsor = false,
  });

  @override
  final bool namePlate;
  @override
  final bool lunchSponsor;

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
        prText == other.prText &&
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
    prText,
    websiteUrl,
    namePlate,
    lunchSponsor,
    scholarship,
  );
}

@immutable
final class ToolSponsor extends CompanySponsor {
  const ToolSponsor({
    required super.id,
    required super.name,
    required super.slug,
    required super.logoUrl,
    required super.prText,
    required super.websiteUrl,
    super.xAccount,
    super.scholarship,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is ToolSponsor &&
        id == other.id &&
        name == other.name &&
        slug == other.slug &&
        logoUrl == other.logoUrl &&
        prText == other.prText &&
        websiteUrl == other.websiteUrl &&
        scholarship == other.scholarship;
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    slug,
    logoUrl,
    prText,
    websiteUrl,
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
    required super.prText,
    required super.websiteUrl,
    super.xAccount,
    super.scholarship,
  });

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
        prText == other.prText &&
        websiteUrl == other.websiteUrl &&
        scholarship == other.scholarship;
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    slug,
    logoUrl,
    prText,
    websiteUrl,
    scholarship,
  );
}

@immutable
final class IndividualSponsor extends Sponsor {
  const IndividualSponsor({
    required super.id,
    required super.logoUrl,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is IndividualSponsor &&
        id == other.id &&
        logoUrl == other.logoUrl;
  }

  @override
  int get hashCode => Object.hash(
    id,
    logoUrl,
  );
}

mixin NamingRightMixin {
  NamingRight get namingRight;
}

mixin NamePlateMixin {
  bool get namePlate;
}

mixin LunchMixin {
  bool get lunchSponsor;
}
