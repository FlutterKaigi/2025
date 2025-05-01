```marmaid
erDiagram
    users {
        uuid id PK
        timestamp created_at
    }

    user_roles {
        uuid user_id FK
        role role
    }

    user_companies {
      uuid user_id PK, FK
      smallint company_id PK, FK
    }

    individuals {
      int id PK
      uuid user_id UK, FK
    }

    individual_drafts {
      int id PK
      int individual_id FK
      text name
      text logo_name
      timestamp created_at
      timestamp updated_at
      uuid approved_by FK
    }

    companies {
      smallint id PK
      timestamp created_at
      timestamp updated_at
    }

    company_invitation {
      smallint company_id FK, PK
      text key
    }

    company_drafts {
      smallint id PK
      smallint company_id FK
      text name
      text name_en
      text logo_name
      uuid created_by FK
      uuid approved_by FK "NULLABLE"
      timestamp created_at
      timestamp updated_at
    }

    sponsor_individuals {
      smallint id PK
      smallint individual_id UK, FK
    }

    sponsors_basic {
      smallint id PK
      smallint company_id UK, FK
      sponsor_type basic_plan
    }

    sponsors_naming_rights {
      smallint id PK
      smallint company_id UK, FK
    }

    sponsors_nameplate {
      smallint id PK
      smallint company_id UK, FK
    }

    sponsors_lunch {
      smallint id PK
      smallint company_id UK, FK
    }

    sponsors_scholarship {
      smallint id PK
      smallint company_id UK, FK
    }

    users ||--o{ user_roles : "has"
    users ||--o{ user_companies : "has"
    users ||--o{ individuals : "has"
    users ||--o{ individual_drafts : "has"
    individual_drafts }o--|| users : "approved by"
    individuals ||--o{ individual_drafts : "has"

    companies ||--o{ user_companies : "has"
    companies ||--o{ sponsors_basic : "has"
    companies ||--o{ sponsors_naming_rights : "has"
    companies ||--o{ sponsors_nameplate : "has"
    companies ||--o{ sponsors_lunch : "has"
    companies ||--o{ sponsors_scholarship : "has"
    companies ||--o{ company_drafts : "has"
    companies ||--o{ company_invitation : "has"

    individuals ||--o{ sponsor_individuals : "has"

    company_drafts }o--|| users : "created by"
    company_drafts }o--o| users : "approved by"

    %% ENUM definitions
    %% sponsor_type (basic_plan):
    %%   - platinum
    %%   - gold
    %%   - silver
    %%   - bronze
```
