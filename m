Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ED9C52DC9
	for <lists+greybus-dev@lfdr.de>; Wed, 12 Nov 2025 16:00:33 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4B6FD3F80B
	for <lists+greybus-dev@lfdr.de>; Wed, 12 Nov 2025 15:00:32 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id A10BC3F702
	for <greybus-dev@lists.linaro.org>; Wed, 12 Nov 2025 15:00:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Ux3gUjoO;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B89160225;
	Wed, 12 Nov 2025 15:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF22C4CEF7;
	Wed, 12 Nov 2025 15:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762959628;
	bh=Gqb+YI2S+/BJWBumgOQifCNHxmdPbzO2WCdjrw8uUuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ux3gUjoOTq1LshF8CkV/eyaaiIG3TSYk1p4lslmSeJyEuKqZ1LbCWcAe4efLwxV1P
	 yWcCc80mVo0IQWNDb6ret3d8hE5jFna0suPNAoLZVt3sHjlIXc/EivqcXwOxLyo8TX
	 1xBWghKTSvdIDwpHMZxb4Vfy/kvL+GcVAc5F9TJ2grPReXcpKW/wHJaYotmhwJpTsh
	 Dlc1KXAPFece67c6ALKLg6Z0Rbayn96mGmEbY/IdRsWIZtCyqJmxoZuBSlzNcTHYKq
	 +a0N0W5+sw0XvOpfmmiqdjNYEjUE+jw5iZA5RqpbdCihIr7mIXTJM35l6kXS3XIIBY
	 NSnXttFYfZomg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vJCKi-000000005r3-0drG;
	Wed, 12 Nov 2025 16:00:28 +0100
Date: Wed, 12 Nov 2025 16:00:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Message-ID: <aRShDB8g0hG7JcWX@hovoldconsulting.com>
References: <20251107132149.177327-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251107132149.177327-1-marco.crivellari@suse.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A10BC3F702
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linaro.org,kernel.org,gmail.com,linutronix.de,suse.com,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received,172.105.4.254:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: P5QBEIIEB5EEOZDRDPNVHLEDUQARRRU4
X-Message-ID-Hash: P5QBEIIEB5EEOZDRDPNVHLEDUQARRRU4
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] drivers/greybus: add WQ_PERCPU to alloc_workqueue users
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/P5QBEIIEB5EEOZDRDPNVHLEDUQARRRU4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGxlYXNlIHVzZSBqdXN0DQoNCglncmV5YnVzOg0KDQphcyBwcmVmaXguDQoNCk5vdGUgdGhhdCBo
YXJkbHkgYW55IGRyaXZlciBzdWJzeXN0ZW1zIGluY2x1ZGUgImRyaXZlcnMvIiBpbiB0aGUgY29t
bWl0DQpzdW1tYXJ5Lg0KDQpPbiBGcmksIE5vdiAwNywgMjAyNSBhdCAwMjoyMTo0OVBNICswMTAw
LCBNYXJjbyBDcml2ZWxsYXJpIHdyb3RlOg0KPiBDdXJyZW50bHkgaWYgYSB1c2VyIGVucXVldWVz
IGEgd29yayBpdGVtIHVzaW5nIHNjaGVkdWxlX2RlbGF5ZWRfd29yaygpIHRoZQ0KPiB1c2VkIHdx
IGlzICJzeXN0ZW1fd3EiIChwZXItY3B1IHdxKSB3aGlsZSBxdWV1ZV9kZWxheWVkX3dvcmsoKSB1
c2UNCj4gV09SS19DUFVfVU5CT1VORCAodXNlZCB3aGVuIGEgY3B1IGlzIG5vdCBzcGVjaWZpZWQp
LiBUaGUgc2FtZSBhcHBsaWVzIHRvDQo+IHNjaGVkdWxlX3dvcmsoKSB0aGF0IGlzIHVzaW5nIHN5
c3RlbV93cSBhbmQgcXVldWVfd29yaygpLCB0aGF0IG1ha2VzIHVzZQ0KPiBhZ2FpbiBvZiBXT1JL
X0NQVV9VTkJPVU5ELg0KPiBUaGlzIGxhY2sgb2YgY29uc2lzdGVuY3kgY2Fubm90IGJlIGFkZHJl
c3NlZCB3aXRob3V0IHJlZmFjdG9yaW5nIHRoZSBBUEkuDQoNCkFwYXJ0IGZyb20gdGhlIG5hbWlu
ZyBvZiB0aGUgV09SS19DUFVfVU5CT1VORCBtYWNybyBJIGRvbid0IHNlZSB0aGUNCmluY29uc2lz
dGVuY3kgaGVyZS4gV2UgcXVldWUgb24gdGhlIGxvY2FsIENQVSBhcyBkb2N1bWVudGVkICh1bmxl
c3MgdGhlDQpDUFUgaXMgbm90IGluIHRoZSB3cV91bmJvdW5kIGNwdW1hc2sgZm9yIHVuYm91bmQg
d29ya3F1ZXVlcykuDQoNCk5vdGUgc3VyZSBob3cgZXhwbGljaXRseSBtYXJraW5nIHBlcmNwdSB3
b3JrcXVldWVzIGlzIGdvaW5nIHRvIGNoYW5nZQ0KdGhpcyBlaXRoZXIgc28gdGhpcyBwYXJhZ3Jh
cGggZG9lc24ndCBzZWVtIHJlbGV2YW50IGZvciB0aGUgY2hhbmdlIGF0DQpoYW5kLg0KDQo+IGFs
bG9jX3dvcmtxdWV1ZSgpIHRyZWF0cyBhbGwgcXVldWVzIGFzIHBlci1DUFUgYnkgZGVmYXVsdCwg
d2hpbGUgdW5ib3VuZA0KPiB3b3JrcXVldWVzIG11c3Qgb3B0LWluIHZpYSBXUV9VTkJPVU5ELg0K
PiANCj4gVGhpcyBkZWZhdWx0IGlzIHN1Ym9wdGltYWw6IG1vc3Qgd29ya2xvYWRzIGJlbmVmaXQg
ZnJvbSB1bmJvdW5kIHF1ZXVlcywNCj4gYWxsb3dpbmcgdGhlIHNjaGVkdWxlciB0byBwbGFjZSB3
b3JrZXIgdGhyZWFkcyB3aGVyZSB0aGV54oCZcmUgbmVlZGVkIGFuZA0KPiByZWR1Y2luZyBub2lz
ZSB3aGVuIENQVXMgYXJlIGlzb2xhdGVkLg0KPiANCj4gVGhpcyBjb250aW51ZXMgdGhlIGVmZm9y
dCB0byByZWZhY3RvciB3b3JrcXVldWUgQVBJcywgd2hpY2ggYmVnYW4gd2l0aA0KPiB0aGUgaW50
cm9kdWN0aW9uIG9mIG5ldyB3b3JrcXVldWVzIGFuZCBhIG5ldyBhbGxvY193b3JrcXVldWUgZmxh
ZyBpbjoNCj4gDQo+IGNvbW1pdCAxMjhlYTlmNmNjZmIgKCJ3b3JrcXVldWU6IEFkZCBzeXN0ZW1f
cGVyY3B1X3dxIGFuZCBzeXN0ZW1fZGZsX3dxIikNCj4gY29tbWl0IDkzMGMyZWE1NjZhZiAoIndv
cmtxdWV1ZTogQWRkIG5ldyBXUV9QRVJDUFUgZmxhZyIpDQo+IA0KPiBUaGlzIGNoYW5nZSBhZGRz
IGEgbmV3IFdRX1BFUkNQVSBmbGFnIHRvIGV4cGxpY2l0bHkgcmVxdWVzdA0KPiBhbGxvY193b3Jr
cXVldWUoKSB0byBiZSBwZXItY3B1IHdoZW4gV1FfVU5CT1VORCBoYXMgbm90IGJlZW4gc3BlY2lm
aWVkLg0KPiANCj4gV2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBXUV9QRVJDUFUgZmxhZyAo
ZXF1aXZhbGVudCB0byAhV1FfVU5CT1VORCksDQo+IGFueSBhbGxvY193b3JrcXVldWUoKSBjYWxs
ZXIgdGhhdCBkb2VzbuKAmXQgZXhwbGljaXRseSBzcGVjaWZ5IFdRX1VOQk9VTkQNCj4gbXVzdCBu
b3cgdXNlIFdRX1BFUkNQVS4NCj4gDQo+IE9uY2UgbWlncmF0aW9uIGlzIGNvbXBsZXRlLCBXUV9V
TkJPVU5EIGNhbiBiZSByZW1vdmVkIGFuZCB1bmJvdW5kIHdpbGwNCj4gYmVjb21lIHRoZSBpbXBs
aWNpdCBkZWZhdWx0Lg0KDQpGYWlyIGVub3VnaCwgdGhlIGRlZmF1bHQgaXMgYWJvdXQgdG8gYmUg
Y2hhbmdlZC4NCg0KPiBTdWdnZXN0ZWQtYnk6IFRlanVuIEhlbyA8dGpAa2VybmVsLm9yZz4NCj4g
U2lnbmVkLW9mZi1ieTogTWFyY28gQ3JpdmVsbGFyaSA8bWFyY28uY3JpdmVsbGFyaUBzdXNlLmNv
bT4NCg0KV2l0aCBhbiB1cGRhdGVkIGNvbW1pdCBtZXNzYWdlIHlvdSBjYW4gYWRkIG15Og0KDQpS
ZXZpZXdlZC1ieTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPg0KDQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncmV5YnVzL29wZXJhdGlvbi5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cmV5YnVzL29wZXJhdGlvbi5jIGIvZHJpdmVycy9ncmV5YnVzL29wZXJhdGlvbi5jDQo+IGluZGV4
IDU0Y2NjNDM0YTFmNy4uN2UxMmZmYjJkZDYwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dyZXli
dXMvb3BlcmF0aW9uLmMNCj4gKysrIGIvZHJpdmVycy9ncmV5YnVzL29wZXJhdGlvbi5jDQo+IEBA
IC0xMjM4LDcgKzEyMzgsNyBAQCBpbnQgX19pbml0IGdiX29wZXJhdGlvbl9pbml0KHZvaWQpDQo+
ICAJCWdvdG8gZXJyX2Rlc3Ryb3lfbWVzc2FnZV9jYWNoZTsNCj4gIA0KPiAgCWdiX29wZXJhdGlv
bl9jb21wbGV0aW9uX3dxID0gYWxsb2Nfd29ya3F1ZXVlKCJncmV5YnVzX2NvbXBsZXRpb24iLA0K
PiAtCQkJCQkJICAgICAwLCAwKTsNCj4gKwkJCQkJCSAgICAgV1FfUEVSQ1BVLCAwKTsNCj4gIAlp
ZiAoIWdiX29wZXJhdGlvbl9jb21wbGV0aW9uX3dxKQ0KPiAgCQlnb3RvIGVycl9kZXN0cm95X29w
ZXJhdGlvbl9jYWNoZTsNCg0KSm9oYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1k
ZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
