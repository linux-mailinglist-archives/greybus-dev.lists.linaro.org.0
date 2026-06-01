Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECktMLREHWpbXwkAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 01 Jun 2026 10:37:08 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5688561B8BE
	for <lists+greybus-dev@lfdr.de>; Mon, 01 Jun 2026 10:37:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A5E1E404A4
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Jun 2026 08:37:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id F3BC93F960
	for <greybus-dev@lists.linaro.org>; Mon,  1 Jun 2026 08:37:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NcJX5h+P;
	spf=pass (lists.linaro.org: domain of lee@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=lee@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 663344094E;
	Mon,  1 Jun 2026 08:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113841F00898;
	Mon,  1 Jun 2026 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780303020;
	bh=3wms+A+84QH76OVr66jdH7Kv7pI3+dDZ+rfdXKI0J4g=;
	h=From:To:Cc:Subject:Date;
	b=NcJX5h+PVk00TwfNJpDuDihLeI3nNtoEn5TQ3IL+bWK3SujbcmKO58Bbny6nAeOEW
	 b0PrXiBhoXimvDdRBxm9B/e7s6rJ/rgIsv1e2LcWZmGCsG6pFAuGhhvAFOrG1AGeOX
	 5bQ9Mf2eCmSkIGQ0kPImCW6eQjXgZVzb4j4B7KmIvV1NUFA/FpCZ9LsuQztjq8p8Kz
	 9i4yk3nS5RiR2S33uQgMEB5ylBExbIlomg/Rjhki9QAAIuBpoByeYV4pn5r/zSlNad
	 Vf63qokCVb/u6MsTzOOPjAviLs3qWu3TyYyDjY4dFc6f0BPYiLowOQnM5MJX7o9y8k
	 RGUOoJzVXQI6w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	=?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Kwok Kin Ming <kenkinming2002@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	bpf@vger.kernel.org
Date: Mon,  1 Jun 2026 09:36:09 +0100
Message-ID: <20260601083642.908433-1-lee@kernel.org>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
MIME-Version: 1.0
X-Spamd-Bar: --
Message-ID-Hash: SRC45H6HSU2Y54FEZRV7AKGHFCCS3ET2
X-Message-ID-Hash: SRC45H6HSU2Y54FEZRV7AKGHFCCS3ET2
X-MailFrom: lee@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: stable@vger.kernel.org, Vicki Pfau <vi@endrift.com>, Jiri Kosina <jkosina@suse.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [linux-6.12.y 1/4] HID: core: Add printk_ratelimited variants to hid_warn() etc
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SRC45H6HSU2Y54FEZRV7AKGHFCCS3ET2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [2.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,riseup.net,hadess.net,wacom.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linaro.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.984];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,suse.com:email,lists.linaro.org:rdns,lists.linaro.org:helo,endrift.com:email]
X-Rspamd-Queue-Id: 5688561B8BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vicki Pfau <vi@endrift.com>

hid_warn_ratelimited() is needed. Add the others as part of the block.

Signed-off-by: Vicki Pfau <vi@endrift.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
(cherry picked from commit 1d64624243af8329b4b219d8c39e28ea448f9929)
Signed-off-by: Lee Jones <lee@kernel.org>
---
 include/linux/hid.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 7d8d09318fa9..bef017d6b440 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1245,4 +1245,15 @@ void hid_quirks_exit(__u16 bus);
 #define hid_dbg_once(hid, fmt, ...)			\
 	dev_dbg_once(&(hid)->dev, fmt, ##__VA_ARGS__)
 
+#define hid_err_ratelimited(hid, fmt, ...)			\
+	dev_err_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_notice_ratelimited(hid, fmt, ...)			\
+	dev_notice_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_warn_ratelimited(hid, fmt, ...)			\
+	dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_info_ratelimited(hid, fmt, ...)			\
+	dev_info_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_dbg_ratelimited(hid, fmt, ...)			\
+	dev_dbg_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
+
 #endif
-- 
2.54.0.823.g6e5bcc1fc9-goog

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
