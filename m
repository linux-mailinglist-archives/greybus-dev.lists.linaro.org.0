Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fj/NOspmMWoaigUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jun 2026 17:07:54 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB20690C59
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jun 2026 17:07:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20201202 header.b=WmPShMF+;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AAB1B4051A
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jun 2026 15:07:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id C286D3F7D8
	for <greybus-dev@lists.linaro.org>; Tue, 16 Jun 2026 06:06:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 557B5601E1;
	Tue, 16 Jun 2026 06:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F382DC2BCB8;
	Tue, 16 Jun 2026 06:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781589973;
	bh=JNCFzqk3xEM/IcqcOJC7ptkFyxpfdBNO+vFuZnuEpjc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=WmPShMF+lXfgJIrxH0JbFcSh3t1gVwqK6Z8z6QUUK6imwWZFeD1woe7QDtZ3aVbVN
	 fxV6rdXy8AuiUDXAyc+JacZ/Sd8sfLPMTsE6xlIb4RbMnEjCqgRJuBlY2DrnAWPyv7
	 e/5/7M65v9KKl9/0Y94vltziBpXdQbpUa2DZXKhI0mocO3FpB2gl4jdtSq2SDcUis6
	 Vd33qFZFx1XVRixSQCOpjqiPFp80ZsBcppayxfmIUil4JV2Epdw6rSM8qN8a/+w/Wh
	 ERIsOjhdxwDSP5XMTStigZ3DJEHyIh9wpAiHzEgw8506+sskcKGMpk1Gti1hMpGwYP
	 9w3Fmh8DPmizQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D93CD98DA;
	Tue, 16 Jun 2026 06:06:12 +0000 (UTC)
From: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>
Date: Tue, 16 Jun 2026 01:06:12 -0500
MIME-Version: 1.0
Message-Id: <20260616-b4-disp-4352e8b0-v1-1-3e09f62e0ad5@proton.me>
X-B4-Tracking: v=1; b=H4sIANPnMGoC/x3MTQqAIBBA4avErBtQ0yG7SrToZ6rZmChEIN09a
 fkt3iuQOQlnGJoCiW/JcoUK3TawnnM4GGWrBqMMKdKEi8VNckTbOcP9otA67omc944YahYT7/L
 8y3F63w/cNqTYYgAAAA==
To: Mark Greer <mgreer@animalcreek.com>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781589971; l=3388;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=7Nd691qGBfOJSIBEQHMHLFIBuWUkCigjnPpH2+uLF24=;
 b=J3dq6yVkfTUOaBX3BnpxsFzk0FIOTk1QZZ/si4FwAg2Dme5nV6K71bOhhu3NQ+r+xEyr+5JtO
 b+Bzx6mJM9kADaYBHURg5Xd7qlL3cYRRSbop7Uvvo73TuzLG9WCkOlT
X-Developer-Key: i=hexlabsecurity@proton.me; a=ed25519;
 pk=dmppBMZNLLoPzxHi9l8tZDzEZUunPbgsYqIZYXeUrL0=
X-Endpoint-Received: by B4 Relay for hexlabsecurity@proton.me/proton with
 auth_id=814
X-Original-From: Bryam Vargas <hexlabsecurity@proton.me>
X-Spamd-Bar: ------
X-MailFrom: devnull+hexlabsecurity.proton.me@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4ZFUTNZIYAXGSOX2HWUQKFGQTLDMOAHC
X-Message-ID-Hash: 4ZFUTNZIYAXGSOX2HWUQKFGQTLDMOAHC
X-Mailman-Approved-At: Tue, 16 Jun 2026 15:07:46 +0000
CC: Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Reply-To: hexlabsecurity@proton.me
Subject: [greybus-dev] [PATCH] greybus: audio: bound the topology section sizes against the fetched size
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4ZFUTNZIYAXGSOX2HWUQKFGQTLDMOAHC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.49 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mgreer@animalcreek.com,m:vaibhav.sr@gmail.com,m:johan@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:greybus-dev@lists.linaro.org,m:elder@kernel.org,m:vaibhavsr@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de,hexlabsecurity.proton.me];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[animalcreek.com,gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,greybus-dev-bounces@lists.linaro.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[greybus-dev];
	HAS_REPLYTO(0.00)[hexlabsecurity@proton.me];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,linaro.org:email,proton.me:replyto,proton.me:email,proton.me:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DB20690C59

From: Bryam Vargas <hexlabsecurity@proton.me>

gb_audio_gb_get_topology() fetches a topology blob of a module-supplied
size, and gbaudio_tplg_parse_data() then walks it by adding the
module-supplied size_dais, size_controls and size_widgets fields to
form the control, widget and route section offsets. Those le32 sizes
are never checked against the fetched blob, so a module reporting a
small topology size but large section sizes makes the offsets point
past the allocation, and parsing reads out of bounds.

Reject a topology whose section sizes do not fit within the fetched
size before it is parsed.

Fixes: 184992e305f1 ("greybus: audio: Add Greybus Audio Device Class Protocol helper routines")
Cc: stable@vger.kernel.org
Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
---
I reproduced the out-of-bounds read both in-kernel under KASAN and with
a userspace AddressSanitizer model of the gbaudio_tplg_process_header()
offset walk. The topology blob is kzalloc(size) where size is
module-supplied (a u16), and process_header() forms control_offset =
&data + size_dais, widget_offset = control_offset + size_controls, etc.;
the consumers then read structs at those offsets.

  - In-kernel (7.1.0-rc5 + KASAN): a 64-byte blob (header 24, so 40 bytes
    available) with size_dais = 44 makes control_offset point 4 bytes
    past the allocation, and reading the first control byte there trips:

      BUG: KASAN: slab-out-of-bounds in ...parse_topology...
      Read of size 1 at addr ...
      ... which belongs to the cache kmalloc-64 of size 64
      The buggy address is located 4 bytes to the right of
       allocated 64-byte region

    The patched arm (sections rejected, -EINVAL) and an in-bounds control
    arm (size_dais = 8) read cleanly with no KASAN report.
  - ASan model (-m32 and -m64): size_dais = 4096 makes control_offset
    point ~4 KB past the 64-byte blob - heap-buffer-overflow READ located
    4056 bytes after the region, both ABIs; patched and in-bounds clean.

The source is a greybus audio module trust boundary (an attacker-supplied
or compromised module reporting a malformed topology); the access is a
read, and a large size_dais sends the offset far enough to fault. The
reproducer (kernel module + ASan model) is available on request.
---
 drivers/staging/greybus/audio_gb.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..144591f1a512 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -37,6 +37,19 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
 		return ret;
 	}
 
+	/*
+	 * The size_* fields are supplied by the module and are used by
+	 * gbaudio_tplg_parse_data() to compute offsets into the blob; make
+	 * sure the sections fit within the fetched topology, so walking it
+	 * cannot read out of bounds.
+	 */
+	if ((u64)le32_to_cpu(topo->size_dais) + le32_to_cpu(topo->size_controls) +
+	    le32_to_cpu(topo->size_widgets) + le32_to_cpu(topo->size_routes) >
+	    size - sizeof(*topo)) {
+		kfree(topo);
+		return -EINVAL;
+	}
+
 	*topology = topo;
 
 	return 0;

---
base-commit: 8e65320d91cdc3b241d4b94855c88459b91abf66
change-id: 20260616-b4-disp-4352e8b0-45e86659956e

Best regards,
-- 
Bryam Vargas <hexlabsecurity@proton.me>


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
