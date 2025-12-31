INSERT INTO "ItemType" (id, name, icon, color, "isSystem")
SELECT gen_random_uuid(), 'snippet', 'Code', '#3b82f6', true
WHERE NOT EXISTS (SELECT 1 FROM "ItemType" WHERE name = 'snippet' AND "isSystem" = true);

INSERT INTO "ItemType" (id, name, icon, color, "isSystem")
SELECT gen_random_uuid(), 'prompt', 'Sparkles', '#8b5cf6', true
WHERE NOT EXISTS (SELECT 1 FROM "ItemType" WHERE name = 'prompt' AND "isSystem" = true);

INSERT INTO "ItemType" (id, name, icon, color, "isSystem")
SELECT gen_random_uuid(), 'file', 'File', '#6b7280', true
WHERE NOT EXISTS (SELECT 1 FROM "ItemType" WHERE name = 'file' AND "isSystem" = true);

INSERT INTO "ItemType" (id, name, icon, color, "isSystem")
SELECT gen_random_uuid(), 'note', 'StickyNote', '#fde047', true
WHERE NOT EXISTS (SELECT 1 FROM "ItemType" WHERE name = 'note' AND "isSystem" = true);

INSERT INTO "ItemType" (id, name, icon, color, "isSystem")
SELECT gen_random_uuid(), 'image', 'Image', '#ec4899', true
WHERE NOT EXISTS (SELECT 1 FROM "ItemType" WHERE name = 'image' AND "isSystem" = true);

INSERT INTO "ItemType" (id, name, icon, color, "isSystem")
SELECT gen_random_uuid(), 'link', 'Link', '#10b981', true
WHERE NOT EXISTS (SELECT 1 FROM "ItemType" WHERE name = 'link' AND "isSystem" = true);

INSERT INTO "ItemType" (id, name, icon, color, "isSystem")
SELECT gen_random_uuid(), 'command', 'Terminal', '#f97316', true
WHERE NOT EXISTS (SELECT 1 FROM "ItemType" WHERE name = 'command' AND "isSystem" = true);
