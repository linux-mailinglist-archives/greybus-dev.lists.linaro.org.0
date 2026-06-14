Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sO2vB3XfL2omIQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:18:13 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B5063685AAD
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:18:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="MHeJW/gI";
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CBA3640AA0
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 11:18:11 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	by lists.linaro.org (Postfix) with ESMTPS id A4F2E405C7
	for <greybus-dev@lists.linaro.org>; Sun, 14 Jun 2026 15:45:30 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490c1915793so21599235e9.2
        for <greybus-dev@lists.linaro.org>; Sun, 14 Jun 2026 08:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781451930; x=1782056730; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opTcDvpoHFRHn9n+WZGobddkXtZDg7nJ4XpbwWq3BKs=;
        b=MHeJW/gIqY2xJpVrEctPxtTpZxipz8ZODXtOp8HEfm5pXin8z28S1UF3ERd1KA/Yzm
         r+fWZM9lQ9ms4G+RcBBMGLP1mV4foAntMMtuu9ElgjGXy4DdqK49RFbLRla5Ro0edVO0
         p1O3YQHPYydD4yQ924YRuSuLR1+QvXBgbDqXAcWnur1tlrfr/Y0MIneezudG3G2jHY8q
         Q3hVa5iA9ugOXf+Aieog6UouwqxfELKBF7AlQ462jp53dD2xZZ5uLkpkgo8NmYTnV7Kw
         DtppkwJg7K87xSJz34Sc0j6Fu+8WXGVcnQZRV0AnYwiWVs19z1Seq1gRz1hcedAWJvs0
         bUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781451930; x=1782056730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opTcDvpoHFRHn9n+WZGobddkXtZDg7nJ4XpbwWq3BKs=;
        b=j6LYny1F0R7hM4x0rBkree/cTpvlCShwbmoIqF8hXdu9huRDkdfX50Npx5ix3h0Y10
         cwhx6bIPGnrrtDZR87FlMGy/qoMb0+nVjsZ2B3pL/Y0zp1Vi/MG5Tm0MQDWMeMp184kk
         JF6SuHTS/OB5IeBzKLYE9vKcZUCBh2d5bJPuybHYyz8H4TwUGJmiC5BPtTPCYX/YtseN
         bk/ARSKO/n0Qg/hi9iGJ3iOFwK3YRYBKwnzoPuN6T/lb7z8cnkO/nbOQ6vgmJL7UH8sk
         415tTSbVjg/qdiGnBNMHliqfVo0sCSKEfvvv+lDMD7IW0cEarkwhmUsCoHzOKG0vih27
         yINg==
X-Forwarded-Encrypted: i=1; AFNElJ9lQ26Wbj4KZoMjcAk6ZCqsnJ779yCjiUCpt3htAOoLtFnSyHS8fJXml7QllPtEeNkoK9YxDXyHwoNm4w==@lists.linaro.org
X-Gm-Message-State: AOJu0YxLVLQFdy4+H1hwUD6F+pHHddZUna79o8VkDdD9GKQzvfcj/0jo
	zIzq6NkYMaUGTgBEDof1CML2k4pPAr3U9JoPC1E84oHAFCWD9QZK7WxK
X-Gm-Gg: Acq92OEEK5Dbo8CGRU0AJ96TAueEwc2heMGj2D5mdLDwr/piyIzhDsL9GNTQ0nbAmH7
	+SgzXqOeIIhFyjUDt2CMIklKOEeeDah0+dbwAyeSAmjAbpd4T2TqL6FjSmPi1gr00ODvf7338ks
	L6E4mn/+jiEq+VYMmRKfRV4EJFXXHxTsW8ZOo8EytQOGeCUUQTBjp+EjYC//uzvfjmbb0TTnVcT
	DQ1uwXRyKP4Y4N0NL9X+NqUlzPBDRKDHBAzo1ASRSF2KOZUol+Sxrr+SorAvtPzRpGM7vqJnd59
	A5asYYzVJfxxI2esSvPEOh5zhYpqGMhCfY0hvjgAPpnKnTwzrFLnX6GyQHp/zZG/TfmMOcQQ72G
	grxpMTbwVTDmLkICrIZjQ+0lpRonwLEyDgtkbBoiGqe43vXSRU0LrYW4eNFKi51izRjghlVdKC5
	e5q4VveLU23cfGMwRM7Pel3/MB2Ful5bjk8eU0gzn8K6L8+w==
X-Received: by 2002:a05:600c:4685:b0:490:e190:3b50 with SMTP id 5b1f17b1804b1-490ec4d4f7cmr162561785e9.9.1781451929565;
        Sun, 14 Jun 2026 08:45:29 -0700 (PDT)
Received: from fedora ([154.182.122.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922031b7d2sm184237135e9.5.2026.06.14.08.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:45:29 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: gregkh@linuxfoundation.org
Date: Sun, 14 Jun 2026 18:43:29 +0300
Message-ID: <20260614154329.5176-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260614154329.5176-1-abdelnasserhussein11@gmail.com>
References: <20260614154329.5176-1-abdelnasserhussein11@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: abdelnasserhussein11@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 75EKY3RVKAZGQ2QOBFF6PJTJTEXMWZJZ
X-Message-ID-Hash: 75EKY3RVKAZGQ2QOBFF6PJTJTEXMWZJZ
X-Mailman-Approved-At: Mon, 15 Jun 2026 11:17:32 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Abdelnasser Hussein <abdelnasserhussein11@gmail.com>, kernel test robot <lkp@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 2/2] staging: greybus: audio_codec: remove redundant else-if check
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/75EKY3RVKAZGQ2QOBFF6PJTJTEXMWZJZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:abdelnasserhussein11@gmail.com,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[abdelnasserhussein11@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com,intel.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdelnasserhussein11@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5063685AAD

In gbaudio_module_update(), the widget id is validated earlier in the
function to ensure it is either snd_soc_dapm_aif_in or
snd_soc_dapm_aif_out.

Remove the redundant else-if check for snd_soc_dapm_aif_out. The
remaining branch can only handle snd_soc_dapm_aif_out, which avoids
a compiler warning about a potentially uninitialized variable.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606140347.gGVWDnbi-lkp@intel.com/

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
Changes in v3:
- Split from the previous v2 patch to address the uninitialized variable
  warning separately.

 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 295222ec0f1a..6daa4e706792 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -322,7 +322,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
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
