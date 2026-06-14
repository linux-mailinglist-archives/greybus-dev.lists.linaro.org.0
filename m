Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3xDGDmXfL2ofIQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:17:57 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id DD316685A97
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:17:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=nR8sEOBk;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0054640A96
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 11:17:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	by lists.linaro.org (Postfix) with ESMTPS id 88CF43F767
	for <greybus-dev@lists.linaro.org>; Sun, 14 Jun 2026 06:09:46 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b3637b90so16390725e9.3
        for <greybus-dev@lists.linaro.org>; Sat, 13 Jun 2026 23:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781417385; x=1782022185; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DrZxkAgBrgWZE1APhH3jZINrbNeZRGIQoGoFoO1ZxfA=;
        b=nR8sEOBk9nsyeOfCz13KG5uQahbuinULjPUkmN+hSWMQCbFNMEwF/UhFyonyzeOSlF
         l29wHHCkFpp35owjZ+xpr9zbKgkNvwU2suK766gZUpv/dwhdqn5HUPnNvc1njPvY12y7
         qW1dxw6xNH/tf/vadMi+eSuxyRHMx/xaHQIOVZMxCO/ijVooank/tH+DxNWnSB9QsLYr
         3RqZm6TUJ1YPAuSmrld+nqXQzh2ZsfFqxv7h/W1yB3FYU7BMYn6MDU7YRimXo27X9zSc
         BEoQludeUDSO8MUj3Eq6jK+izBLHpyzsl9dKzq5dz1o/VqdU/9WyhJZMvbUpTtVHX192
         Wvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781417385; x=1782022185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrZxkAgBrgWZE1APhH3jZINrbNeZRGIQoGoFoO1ZxfA=;
        b=IhC/SSZzCnEnaFZHFM0NyS/haJKX0jbwUi5j1+Prk9sdC81a7D2gS2UyGfyMKtX/vo
         eNCG0hW6RUizuCqDkmNWIsBVHWurdRqUvBnv32c9O6MMWNn4dmEAmNvJ5G41OGSjgL6w
         Shh+n3AvgmSL6Bv1DcFQmtPVR5bUtG4d7xEj38KLbUXW5ZU8haX5K+DrZ6EcLut5We8z
         70gRNJnO5ufKAQrSLwqquSALfvQViC8ojxGeBIZvLD5ZRk6QIlgMtsAt+uDDrsfjtL27
         LpykZgNH++Rk81W5hgxE3MJ92QJsIXAiBNFStYWGm3AxAbTSS8lIbYZsKp6nDHsHyHsk
         4SEw==
X-Gm-Message-State: AOJu0YwccKhrYaxo65D0LrOCOi2vhGVkkj800fsSuOHLOI9/AOjyO1x8
	Vvx3oxTd3pb/mnukVCLRdKZycIOsl91LNhZ0N5D1JDrjjCy+MEdFOEJ5
X-Gm-Gg: Acq92OEku1eIe4KS3LJ04CZ4xIAIpg+5EupxXhXvwBHNOhPzZdGuwyzF4tVTdehu//N
	ff5kspQ8y4X1BqhklAw9LP0u9fV2RDpfTxMYMNSdhDSoCITCNGOAD97SKOGLqfA1gl7P+ddearz
	Yyk3rRKrnd3Bom2Tx2ODi2aV7IaT2aNZ07rfctCs4zBx2m9r6gHjUMwqbH4b9TuMISRqULgp+vv
	9ji58Twb5oCkIc1D9nLEkSZK6Q4yiSklzCR+mPwaEinXzeaXz2BNyDwA4z51lTFw6EYN1h9G1GR
	UIDmclrmhCNP2Sk+BOe8fyEwkSWGcWEVz/r8ResdpX89c5uYI8lJp1TyFkucx5r41N6i+Z9nXQN
	V3eOrVCXKm75Gey4uVlEcNFoA32Gu6Po6XOnIICllGVwGvCs4rdJ+x0KtK0kGg7a7VpPOR08hM1
	d/RRVBpH+8JCUbY8mJ+dQ/i/2YTZ7MMLvgumDMUlpteOk4xQ==
X-Received: by 2002:a7b:c8ca:0:b0:490:6237:521d with SMTP id 5b1f17b1804b1-49220092e7dmr49935755e9.13.1781417385421;
        Sat, 13 Jun 2026 23:09:45 -0700 (PDT)
Received: from fedora ([154.182.122.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm125598265e9.2.2026.06.13.23.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 23:09:44 -0700 (PDT)
From: abdelnasser hussein <abdelnasserhussein11@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 14 Jun 2026 09:08:57 +0300
Message-ID: <20260614060857.15366-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: abdelnasserhussein11@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FQQP7S4NMCPV2TTCW73MX6KH63RUSGLC
X-Message-ID-Hash: FQQP7S4NMCPV2TTCW73MX6KH63RUSGLC
X-Mailman-Approved-At: Mon, 15 Jun 2026 11:17:31 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, abdelnasser hussein <abdelnasserhussein11@gmail.com>, kernel test robot <lkp@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: audio: check sscanf() result directly
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FQQP7S4NMCPV2TTCW73MX6KH63RUSGLC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	DATE_IN_PAST(1.00)[29];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vaibhav.sr@gmail.com,m:mgreer@animalcreek.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:abdelnasserhussein11@gmail.com,m:lkp@intel.com,m:vaibhavsr@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com,intel.com];
	FORGED_SENDER(0.00)[abdelnasserhussein11@gmail.com,greybus-dev-bounces@lists.linaro.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdelnasserhussein11@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD316685A97

Smatch warns:

  drivers/staging/greybus/audio_codec.c:335 gbaudio_module_update()
  warn: sscanf doesn't return error codes

sscanf() returns the number of successfully matched input items, not a
negative error code. Compare the return value directly with the expected
number of conversions instead of storing it in ret as an error code.

Also remove the redundant else-if check for snd_soc_dapm_aif_out. The
widget id is validated earlier in the function, so the remaining branch
can only handle snd_soc_dapm_aif_out. This avoids a compiler warning
about a potentially uninitialized variable.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606140347.gGVWDnbi-lkp@intel.com/

Signed-off-by: abdelnasser hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 720aa752e17e..6daa4e706792 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -311,8 +311,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 	}
 
 	/* parse dai_id from AIF widget's stream_name */
-	ret = sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir);
-	if (ret < 3) {
+	if (sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir) != 3) {
 		dev_err(codec->dev, "Error while parsing dai_id for %s\n", w->name);
 		return -EINVAL;
 	}
@@ -323,7 +322,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 			ret = gbaudio_module_enable_tx(codec, module, dai_id);
 		else
 			ret = gbaudio_module_disable_tx(module, dai_id);
-	} else if (w->id == snd_soc_dapm_aif_out) {
+	} else {
 		if (enable)
 			ret = gbaudio_module_enable_rx(codec, module, dai_id);
 		else
-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
