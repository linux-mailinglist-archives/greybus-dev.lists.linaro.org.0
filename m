Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNZXB9j34GnZnwAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Apr 2026 16:53:12 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2D140FDC8
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Apr 2026 16:53:11 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9B96140962
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Apr 2026 14:53:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 28700404F3
	for <greybus-dev@lists.linaro.org>; Thu, 16 Apr 2026 14:48:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=ZlVOa947;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of bentiss@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=bentiss@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83227435F5;
	Thu, 16 Apr 2026 14:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50373C2BCAF;
	Thu, 16 Apr 2026 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776350913;
	bh=3SMm/GE9atvakUwuWH33A0fNhiRH7rflF+YNi58ygkY=;
	h=From:Subject:Date:To:Cc:From;
	b=ZlVOa947YM+rxx3rFQIfwBIk1bAaYp2uWzNXRmBquLav3iujHev1OJsO2c+mANenU
	 b8IqRQkI1r9hiZ71733yZi1VKd2ucPoLcmpmY10sLh9DDEmPDj5eTw+BFEJTZVdNTx
	 ljb4fhsafnIpsV8N2/U3zEykY5vs4N3DyrPZO9Wk7DqcooJg0siNbb+X8P0sudTAX2
	 /AXmIw8FbRx4iR64OsZXR0kngkcBTid03rcqmx/nykAOqGiGCYD/2ZJaPaJcFYG8t7
	 amaBiQNXxNFFOzRNWR5Amb1kV5yQzw66RFIXBmMa5fJd0IFm9GDUNNfFKiisgFmeyy
	 5Wbb+LfWXbMxw==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Thu, 16 Apr 2026 16:48:26 +0200
Message-Id: <20260416-wip-fix-core-v2-0-be92570e5627@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMQQ6CMBBFr0Jm7Zi2UGhceQ/DwrQjTDSUTE3Vk
 N7dyt7l+z/vbZBImBKcmg2EMieOSwVzaMDP12Ui5FAZjDK96rTFF6944zf6KIRDcNY7q3sKCqq
 yCtVvz13GyjOnZ5TPXs/6t/4JZY0KKbS+8860erDnO8lCj2OUCcZSyhe+9+biqQAAAA==
X-Change-ID: 20260415-wip-fix-core-7d85c8516ed0
To: Jiri Kosina <jikos@kernel.org>,
 =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
 Bastien Nocera <hadess@hadess.net>, Ping Cheng <ping.cheng@wacom.com>,
 Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776350910; l=2834;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=3SMm/GE9atvakUwuWH33A0fNhiRH7rflF+YNi58ygkY=;
 b=5kq2icneswyIDMBiaEtQccQWFcmeGViTcU2rnj6TrUMi8iIVO5eGzRME6GOwxG12IlhxCnJnv
 Yqj2LEHXXtYA0livb9+WDHB9oHtBFW2Ybhvo8DL2EJukMfUH0+/5+vm
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=
X-Spamd-Bar: ---
Message-ID-Hash: E62XDBYN6F553XLY26MXWWTR652CU67B
X-Message-ID-Hash: E62XDBYN6F553XLY26MXWWTR652CU67B
X-MailFrom: bentiss@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 0/4] HID: Proper fix for OOM in hid-core
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E62XDBYN6F553XLY26MXWWTR652CU67B/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.956];
	FROM_NEQ_ENVFROM(0.00)[bentiss@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 8B2D140FDC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 0a3fe972a7cb ("HID: core: Mitigate potential OOB by removing
bogus memset()") enforced the provided data to be at least the size of
the declared buffer in the report descriptor to prevent a buffer
overflow.

We only had corner cases of malicious devices exposing the OOM because
in most cases, the buffer provided by the transport layer needs to be
allocated at probe time and is large enough to handle all the possible
reports.

However, the patch from above, which enforces the spec a little bit more
introduced both regressions for devices not following the spec (not
necesserally malicious), but also a stream of errors for those devices.

Let's revert to the old behavior by giving more information to HID core
to be able to decide whether it can or not memset the rest of the buffer
to 0 and continue the processing.

Note that the first commit makes an API change, but the callers are
relatively limited, so it should be fine on its own. The second patch
can't really make the same kind of API change because we have too many
callers in various subsystems. We can switch them one by one to the safe
approach when needed.

The last 2 patches are small cleanups I initially put together with the
2 first patches, but they can be applied on their own and don't need to
be pulled in stable like the first 2.

Cheers,
Benjamin

Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
Changes in v2:
- added a small blurb explaining the difference between the safe and the
  non safe version of hid_safe_input_report
- Link to v1: https://lore.kernel.org/r/20260415-wip-fix-core-v1-0-ed3c4c823175@kernel.org

---
Benjamin Tissoires (4):
      HID: pass the buffer size to hid_report_raw_event
      HID: core: introduce hid_safe_input_report()
      HID: multitouch: use __free(kfree) to clean up temporary buffers
      HID: wacom: use __free(kfree) to clean up temporary buffers

 drivers/hid/bpf/hid_bpf_dispatch.c |  6 ++--
 drivers/hid/hid-core.c             | 67 ++++++++++++++++++++++++++++++--------
 drivers/hid/hid-gfrm.c             |  4 +--
 drivers/hid/hid-logitech-hidpp.c   |  2 +-
 drivers/hid/hid-multitouch.c       | 18 ++++------
 drivers/hid/hid-primax.c           |  2 +-
 drivers/hid/hid-vivaldi-common.c   |  2 +-
 drivers/hid/i2c-hid/i2c-hid-core.c |  7 ++--
 drivers/hid/usbhid/hid-core.c      | 11 ++++---
 drivers/hid/wacom_sys.c            | 46 +++++++++-----------------
 drivers/staging/greybus/hid.c      |  2 +-
 include/linux/hid.h                |  6 ++--
 include/linux/hid_bpf.h            | 14 +++++---
 13 files changed, 109 insertions(+), 78 deletions(-)
---
base-commit: 7df6572f1cb381d6b89ceed58e3b076c233c2cd0
change-id: 20260415-wip-fix-core-7d85c8516ed0

Best regards,
-- 
Benjamin Tissoires <bentiss@kernel.org>

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
