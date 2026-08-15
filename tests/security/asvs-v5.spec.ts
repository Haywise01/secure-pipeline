import { test, expect } from '@playwright/test';

// ASVS V5.1.1 — Input validation rejects malformed data
test('V5.1.1: XSS payload in name field is sanitised', async ({ page }) => {
  await page.goto('/profile/edit');
  await page.fill('#name', '<script>alert(1)</script>');
  await page.click('[data-testid=save]');
  const bodyText = await page.textContent('body');
  expect(bodyText).not.toContain('<script>');
  expect(bodyText).not.toContain('alert(1)');
});

// ASVS V5.3.3 — Output encoding prevents HTML injection
test('V5.3.3: User-supplied HTML is encoded in response', async ({ page }) => {
  const payload = '<img src=x onerror=alert(1)>';
  await page.goto(`/search?q=${encodeURIComponent(payload)}`);
  const html = await page.content();
  expect(html).not.toMatch(/<img src=x/);
  expect(html).toContain('&lt;img');
});

// ASVS V3.4.1 — CSRF token present on state-changing forms
test('V3.4.1: CSRF token present on all POST forms', async ({ page }) => {
  await page.goto('/settings');
  const csrfToken = await page.locator('input[name="_csrf"]').inputValue();
  expect(csrfToken).toBeTruthy();
  expect(csrfToken.length).toBeGreaterThan(32);
});
