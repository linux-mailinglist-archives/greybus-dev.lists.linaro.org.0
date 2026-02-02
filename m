Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHdGLiGqgGkFAQMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Feb 2026 14:44:01 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 336AFCCE52
	for <lists+greybus-dev@lfdr.de>; Mon, 02 Feb 2026 14:44:01 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 382DC3F808
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Feb 2026 13:44:00 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	by lists.linaro.org (Postfix) with ESMTPS id CDC743F7AC
	for <greybus-dev@lists.linaro.org>; Mon,  2 Feb 2026 13:32:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="Gajn/mXN";
	spf=pass (lists.linaro.org: domain of eitan.collett@gmail.com designates 209.85.128.52 as permitted sender) smtp.mailfrom=eitan.collett@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so32662685e9.3
        for <greybus-dev@lists.linaro.org>; Mon, 02 Feb 2026 05:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770039167; x=1770643967; darn=lists.linaro.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=flyWbnLkGe8ShZWh5QG8sMP2F4Ss5eue0eQtxiJgbhk=;
        b=Gajn/mXNpSdhnfgbapJTmeOfIjnd2i5QjmxWYUhqFq48gCKjWORux2AtG4VWGMqwM+
         PWm4sfQ4c0bIwRk4zDroOfdDGGae9XRwUThtzoHQUfmPYf08aQV5UyBmQbf8Xk7la83k
         nGSNeSyNvMXrngrDAeq5a6l4lfTAs5pOwDdwXDVaXCwKCgIuXpduRUndxfe2axXCqna+
         reakB/WfQ+AsoVvk9i1RDx4RJa7uq0Pt3+g+58+FYttspgZbOxirivVwSlL5TfvttdXA
         OMM8lA8qQ4odA452k9L/KPNdDRKg/DMwBTXZDIIDIWi4466LHzbgOamhTUyUyPcbLO7l
         6t2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770039167; x=1770643967;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flyWbnLkGe8ShZWh5QG8sMP2F4Ss5eue0eQtxiJgbhk=;
        b=oiLobkd/irFP/6xIZZaHCiE84GE1i/tdUfH+0s82Ar/AKUGHpfX0mKIc0s5mQF/M0d
         mZaTFIy6/mMzEJHIQD/eg0SBUYRdjbOESJg74h3hcE4Th0XzKJBX7sy5xEjOzLScyF8J
         HPBqqlq3Jn7W31955vKatjmzlIbJX8G3hTWFbjVpw4kEArhjDS6BvjBtO5M0uXUIeEIp
         10ShHSy5TGWF68AXo7PbyxLVJhr8FoGH2QXvSa4kplED36eq2dG+6NOFv8kWJV4s+qiT
         4TFp3Shguel1IUzV0toAZuAH05LYwFbx2u604PLIi40OhLoUziMMvHZdy0pVKwIsBPF6
         v+/w==
X-Forwarded-Encrypted: i=1; AJvYcCXOjpSYBBEJHnp1yxtt+t34FL1HmaHortMeWo0SUDxFegMGdSkItTEgIscPR3KD+JfmRkFCtks/yX1AOQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YwAf+SYTzQkWY7euSknoBPgxd64S23RkM+/4Z+TtCOAdkkQhJAF
	TOCkCWRcm16HzyQAheq7rpw3pa/Wu1TSwy7zJ+8S7HZd2IM8cPacWHo=
X-Gm-Gg: AZuq6aIlcjQRCPFpGPxd687F9uYTy5F+rqueMZbZmMAwIwLVb8gTlG2wswA3iAYg3Z6
	EiGvPyxqX/HyASsMxsHJ1iCEZzxUS743fW8EfzBnp4MF2GtN7cNFtlf4/+rpWicVuJTz1VV8Uc+
	5l/1xqyPtbobwCDJhQMhj37ROARR4BxGpd16dwTJrdFOj0UH1Ty9A6wEld7tNWkzVdoWurzDifT
	ChRExmNG8vs9vVQytZk2pydrzKmY3d23iTL85yxegoMtxNMXOaz7LwgamBpy6PcZpJwuJ2DXYxv
	RLVmslK+kNmTyqg7AyT1y6FnUHzIrhBm9vFJ5NMW3xBxHRlVegR2QIjgm+zVwF1+h3GNL8CtLQ5
	bBomsLU++5jwLW+5spqtV+VqJe/qn4jqVYeSfd2P8lSZyJfAJ0mQqAhZmDv2qr/3LvzOls9532o
	ZaNAbRUp4=
X-Received: by 2002:a05:600c:4750:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-482db447b7emr148624985e9.3.1770039166633;
        Mon, 02 Feb 2026 05:32:46 -0800 (PST)
Received: from fakie ([31.210.177.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c428basm486251495e9.12.2026.02.02.05.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:32:46 -0800 (PST)
Date: Mon, 2 Feb 2026 15:32:42 +0200
From: Eitan Collett <eitan.collett@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>
Message-ID: <aYCnemXK-f6Htojh@fakie>
MIME-Version: 1.0
Content-Disposition: inline
X-Spamd-Bar: ---
X-MailFrom: eitan.collett@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NT6J7XZLQAE4A6BYTY4F7FEC3C66HN72
X-Message-ID-Hash: NT6J7XZLQAE4A6BYTY4F7FEC3C66HN72
X-Mailman-Approved-At: Mon, 02 Feb 2026 13:43:57 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio_codec.c: Remove unnecessary parentheses in if statement
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NT6J7XZLQAE4A6BYTY4F7FEC3C66HN72/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[eitancollett@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 336AFCCE52
X-Rspamd-Action: no action

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Unnecessary parentheses around 'w->id != snd_soc_dapm_aif_in'
CHECK: Unnecessary parentheses around 'w->id != snd_soc_dapm_aif_out'

Signed-off-by: Eitan Collett <eitan.collett@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 444c53b4e08d..44aee8268d14 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -305,7 +305,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 	dev_dbg(module->dev, "%s:Module update %s sequence\n", w->name,
 		enable ? "Enable" : "Disable");
 
-	if ((w->id != snd_soc_dapm_aif_in) && (w->id != snd_soc_dapm_aif_out)) {
+	if (w->id != snd_soc_dapm_aif_in && w->id != snd_soc_dapm_aif_out) {
 		dev_dbg(codec->dev, "No action required for %s\n", w->name);
 		return 0;
 	}
-- 
2.52.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
