Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jdkKMzhJJWqEGAIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 07 Jun 2026 12:34:32 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5274864FCED
	for <lists+greybus-dev@lfdr.de>; Sun, 07 Jun 2026 12:34:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=tumelty-co-uk.20251104.gappssmtp.com header.s=20251104 header.b=N1hZWgP7;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=none
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 11D43409E3
	for <lists+greybus-dev@lfdr.de>; Sun,  7 Jun 2026 10:34:31 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	by lists.linaro.org (Postfix) with ESMTPS id 37D9C3F827
	for <greybus-dev@lists.linaro.org>; Fri,  5 Jun 2026 19:29:13 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so21608435e9.1
        for <greybus-dev@lists.linaro.org>; Fri, 05 Jun 2026 12:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20251104.gappssmtp.com; s=20251104; t=1780687752; x=1781292552; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rqyuc30a31kxl+uTZbhiHfXsUecDU6zMIJmtbdO0sCo=;
        b=N1hZWgP7vNPIrOmgIpV0ecoI0vk1EVGnTsv808/pyVR6HVz97FucnoWyucOW3Od4Vs
         KTWmG5sTrKATmwjz9Sc9X/5bTB1LeTUA62HJLFUUaYSOAQpRO/witv3iiZ5hCdeawv8z
         r4cpmwTfnGvqJpXHMAnTSuKpVnRSZ1w+1gCVsDJn+bkawjTt9fzAx8RogdlMB6S7kY1S
         SNPKhlAylM+56fvQmXXDS+4YqIwY7toep2HhL+Kn3sfRKCvadx4BUgmAfxtMEXVbXvbq
         MkFJh/mpHjcbzvOuJBNNcTN5AxVSGjCKzIlqqfct4sYefMgB+QlZHBaLrckEAQaWE5kS
         e0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780687752; x=1781292552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rqyuc30a31kxl+uTZbhiHfXsUecDU6zMIJmtbdO0sCo=;
        b=b78onTBb6qxG/iZjnbDHZaCQvWuLpvjtYYkgRprzODV+ndPpvPzP6fyiCDAlQ4+mcF
         MvgNBwVDxOL/Rni44EbImdpXp9znwFvz96u76uDpMYzAI7wKcGeFd8Xnhixs47aHOcQz
         C8opy4ISIb040LgwIAwp3D/O+s0EFck181Z35CJ7leXdLQtbYgaaZwXbPgZfBm86h1Yf
         gCOsZN/sLrDSeBd0OY4LYc8HB9+Y/Oi0CobJk3Xt4fbgVEVS2BSskAQCZgBymXT9N41p
         RhCX2/Mbg0LcT75LSKZ3eE36CRzzE1mV/paanGbowlk3YGQ53vEYKQ8/cgrZS7r+iFDr
         COPw==
X-Forwarded-Encrypted: i=1; AFNElJ+v6QjfRdI13pPZzv8WoP7+2XpBzavfwsC5EEzdb2nOpcN3nZnddepQNC9VEB2MR7nuHAyEmM7TlD3feg==@lists.linaro.org
X-Gm-Message-State: AOJu0YwgRdZeJ8BMN1bPcXBBMH/z4XBPjKG0QTKjDbKwox71qcz6xl0s
	9fFS9HT/+HWRjfPZY8KmnWLPtMD9H1UduolgW+g7Gf5CDI9AAqDie5WoZKot/jmpCig=
X-Gm-Gg: Acq92OFzO1WfovWHonlqWkMdtgPDV2n5wvnsJXIPMID9YyaS0OlokcxKpQYCL5s+yoJ
	+bYzlFUc4SHfDn2+GknLohQUHDAIrJmKA6zd+tXZ/SV/F47K/fJPaoVt8hz6y3T7VF4m6ASDTC8
	RsvSlyX5GqC4NfT0vZrCxaqGDpF6uMz5WswGcj4U9GNhed7OQ0wifzpnuF2cjBCA14jWL5y5M/G
	NPcZmoG+q6kQ+oEkwXPhd5knUFI/iAkDlkEXTf7yS290dfuwpbxwGPEGG6uSHgr2YGMMe0J/iIB
	VwLQLd6N+A9fVAClNWhEFGvg52MfsCfMvtV5IYojS6Xmhh+bgbaA77JsuZ24pqMtSXWZuf1Bi+A
	6toE948wntLnRJfC1VWCSw/AmULg5brRYt/ZJDG6ICe5u+m5APkiNYx/IUTQ4uhSHe5Y87XlgkL
	2u2HDWo+w17nHReycewb0kkPCXcbK3GlcMazg=
X-Received: by 2002:a05:600c:314e:b0:490:bb60:68ca with SMTP id 5b1f17b1804b1-490c2cba7b8mr59213975e9.3.1780687752198;
        Fri, 05 Jun 2026 12:29:12 -0700 (PDT)
Received: from nixos ([83.217.168.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39e024sm231031185e9.4.2026.06.05.12.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 12:29:11 -0700 (PDT)
From: Rhys Tumelty <rhys@tumelty.co.uk>
To: gregkh@linuxfoundation.org
Date: Fri,  5 Jun 2026 20:28:56 +0100
Message-ID: <20260605192857.78944-1-rhys@tumelty.co.uk>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: -
X-MailFrom: rhys@tumelty.co.uk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ASJJZ6EMRPKQOD4JF4JTU5VJP3UYSHPF
X-Message-ID-Hash: ASJJZ6EMRPKQOD4JF4JTU5VJP3UYSHPF
X-Mailman-Approved-At: Sun, 07 Jun 2026 10:34:26 +0000
CC: Rhys Tumelty <rhys@tumelty.co.uk>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio: fix snprintf truncation errors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ASJJZ6EMRPKQOD4JF4JTU5VJP3UYSHPF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.49 / 15.00];
	R_DKIM_REJECT(1.00)[tumelty-co-uk.20251104.gappssmtp.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[39];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DMARC_NA(0.00)[tumelty.co.uk];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rhys@tumelty.co.uk,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:rhys@tumelty.co.uk,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[tumelty-co-uk.20251104.gappssmtp.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rhys@tumelty.co.uk,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tumelty.co.uk:mid,tumelty.co.uk:from_mime,tumelty.co.uk:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5274864FCED

change snprintf() to scnprintf() in both gbaudio_tplg_create_widget()
and gbaudio_tplg_process_kcontrols() to prevent potential string
truncation warnings when prefixing the device id to the control name.

Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
---
 drivers/staging/greybus/audio_topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 76146f91c..b19febabb 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -1087,7 +1087,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 
 	/* Prefix dev_id to widget control_name */
 	strscpy(temp_name, w->name, sizeof(temp_name));
-	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
+	scnprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
 
 	switch (w->type) {
 	case snd_soc_dapm_spk:
@@ -1169,8 +1169,8 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		control->id = curr->id;
 		/* Prefix dev_id to widget_name */
 		strscpy(temp_name, curr->name, sizeof(temp_name));
-		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
-			 temp_name);
+		scnprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
+			  temp_name);
 		control->name = curr->name;
 		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
 			struct gb_audio_enumerated *gbenum =
-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
