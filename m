Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QbBlA80sIGrJyAAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 03 Jun 2026 15:31:57 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 823A0638155
	for <lists+greybus-dev@lfdr.de>; Wed, 03 Jun 2026 15:31:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=YcHkVi27;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 96DCA40A0C
	for <lists+greybus-dev@lfdr.de>; Wed,  3 Jun 2026 13:31:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 806763F756
	for <greybus-dev@lists.linaro.org>; Wed,  3 Jun 2026 13:31:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B0706021A;
	Wed,  3 Jun 2026 13:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA841F00893;
	Wed,  3 Jun 2026 13:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780493509;
	bh=aLlWQ1LrvCYEx3vPjcTSjD5GLe/XKh4mcG9PpMlDvMQ=;
	h=From:To:Cc:Subject:Date;
	b=YcHkVi27MzA9w2HAsoJ/NNPTuAXIjMxJKzjdkgBz6dn7FjMU3ZFyTrLrOVBuwtNVe
	 He4jtDnPja9vRTA2Ra33l93xXaBmrneCLm3VNSVy2Cwt5k1N76eKyZ3JvpBBWCaGW0
	 C/foQ6UbLLsHCWtuTCv3OIqOS0jOs6+Nl//6jK8RFDWpE5eCT7pRlkqY8NyYM3cKs9
	 kfL75e+Mz8Ia1ZmjU9JoC+xcyM49Rdz2xDqkyyPzEYDO7jp7JqpEQJpawdT/ZwJ5iP
	 cmofWPnjVGV4kVMY5HXbeaFebmtLCU8xthBmQ10kiS7gMu770v6/kMhgAxYd7w0lqu
	 54iHxIa9E3HPA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	=?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	bpf@vger.kernel.org
Date: Wed,  3 Jun 2026 14:31:25 +0100
Message-ID: <20260603133140.3069226-1-lee@kernel.org>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
MIME-Version: 1.0
X-Spamd-Bar: --
Message-ID-Hash: 6N2GLO53SPX6KBYNX6BHT46HPEEWTIBX
X-Message-ID-Hash: 6N2GLO53SPX6KBYNX6BHT46HPEEWTIBX
X-MailFrom: lee@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: stable@vger.kernel.org, Vicki Pfau <vi@endrift.com>, Jiri Kosina <jkosina@suse.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [linux-6.6.y 1/3] HID: core: Add printk_ratelimited variants to hid_warn() etc
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6N2GLO53SPX6KBYNX6BHT46HPEEWTIBX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER(0.00)[lee@kernel.org,greybus-dev-bounces@lists.linaro.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:jikos@kernel.org,m:benjamin.tissoires@redhat.com,m:lains@riseup.net,m:hadess@hadess.net,m:ping.cheng@wacom.com,m:jason.gerecke@wacom.com,m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:sashal@kernel.org,m:linux-input@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:bpf@vger.kernel.org,m:stable@vger.kernel.org,m:vi@endrift.com,m:jkosina@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,suse.com:email,endrift.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 823A0638155

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
index 5d37e2349fae..f4bdaf1b8f41 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1252,4 +1252,15 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
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
2.54.0.1032.g2f8565e1d1-goog

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
