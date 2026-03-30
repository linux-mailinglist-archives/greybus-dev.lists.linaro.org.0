Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIDpL81Bymky7AUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 11:26:37 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC4735828A
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 11:26:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 897084044C
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 09:26:36 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	by lists.linaro.org (Postfix) with ESMTPS id 18EAA3F760
	for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2026 08:34:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=M+kk+GRT;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of hechushiguitu666@gmail.com designates 209.85.216.51 as permitted sender) smtp.mailfrom=hechushiguitu666@gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35c238f1063so1994387a91.1
        for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2026 01:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859677; x=1775464477; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J12BhFYptyFLfnU7tLD4pN+BX2lCLcGi17cBlQr11v4=;
        b=M+kk+GRT7O+whNOzXnFR4lLx0VhuCTiIZAr78FICaFWbwlwdlWvx6ufB4010bkuOBi
         /z51/1/NLyUePDx4qu3pb4gtQE5iuuWYdzq+FSVziJbhs/WPgYVlu8RZX4hR+IkNyRyv
         sypDOewNl3PHFYWsdlBoRKv4taIkMv0F8S4bTrYyAcR/fxIudgIQ7RoYyDMBHxarwsR/
         Q1b0jfN/q1JzRYc/Z53ctuyaZuh4KxvYRtntl0+B+h8J8E0DMlhXq80mqgozMYpBFVLf
         IDqBw69vcCULUt1hcdv7El2OHFoOgOpgYuMxlVMhESh6F5A5d/c+zb9ytkVEMA93tOv7
         qWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859677; x=1775464477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J12BhFYptyFLfnU7tLD4pN+BX2lCLcGi17cBlQr11v4=;
        b=BcisUiUApE2N3/X0ouHAC2hUTRe/osV/vxbGqaG2Vgy53dqWQ8tdatq9tJpfkQFBYq
         ciJJZSugqqus4a5jjl3oJ8ktnsPHGl5vets7SHTxR5OOM4uSqo5Kcl3tcVRBBjHlWuC4
         rzOOi3FDZ/8t0ApsM1oaqYgFCza6Y1UMXYP1ULJm9KjLXu5b80wADWAUcjXwBBq3XRc0
         0dE1SIwzFedivH8HRp6EFBi01aCHs2wg4h99G9OMvcJLF1M/Y1PojkFmBaA/Lo+1t8SP
         Nn8Uf+jE40EiS0JuFrzU6rHz05YcmnYhZ/qvQi97SKN1ULQHA/Fp1RODiqIqbDiJ+97L
         AKQA==
X-Forwarded-Encrypted: i=1; AJvYcCX/O52ZDARhCojS3BVFUqSNzI8buEbXJbHBfJ0AesC8TJH39zZHbjcupZeU3bSRX6jXBVNrqZa/tYkq8w==@lists.linaro.org
X-Gm-Message-State: AOJu0Yw1td9isGDRB8ge/gpDvx8t6vywa5RE7lgOQ+BVdX/PHkol+kLN
	w5DRy+fHkBD8fYHV7U4yFvhaNYX+zUNDcSosROuIj6Gt2uSL0BVsR5sU
X-Gm-Gg: ATEYQzy86AXyL+a2xFDErL4veWTwAycZ0X4+qI/u4ZzTL9WEaWgg7nlJ7PfxZhsK/g2
	6lwPhiaiU9eIIJGvBIean6gXcjq8Cfo+tYkdq5K6qhxyLdITtQMaIJe/FrxJb1z8flbXbJrydhb
	qI7KLDllzw1UGVUH7+cDLDZsDeRjAjC4xHFkHuHvDovoJb+P6BWJUQm2ugSgPuFEe/Yzs5Ra//P
	1lyl5EumbvTHvM/eAWrdjhsZYTHsP4aW0+vPp3ig+5+4ggyN8QKmMs6ZoHQsCtZobLwwfB0v2Rl
	GNX/jEqW/bIG0lOMGO/5DaYg4dIbUTg77lAptZrcrQ6gg1C1Hh7JsJGWA6q1mzZS6sC6Wn+cg/q
	M+sPDpmLnxiLbeP9oXWDmSdtdTDGliV+UnDlj55ZHtwcbZa8FnRrsCOcuYZAETV/fFYDZdFLrK9
	hucxCDiesnhBlFfFDh24pnhidIhpjrC0OzTTakk4hOJdd7skn/LNBz7g==
X-Received: by 2002:a17:90a:657:b0:35d:a2d3:5c44 with SMTP id 98e67ed59e1d1-35da2d35e66mr2104168a91.28.1774859677125;
        Mon, 30 Mar 2026 01:34:37 -0700 (PDT)
Received: from ZC-202510311500 ([123.139.39.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d94d057bbsm6429367a91.1.2026.03.30.01.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:34:36 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>
Date: Mon, 30 Mar 2026 16:34:25 +0800
Message-ID: <20260330083425.266-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: hechushiguitu666@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: WZEFDXIXAVDNF5K4DKNREDZQK5VGNSIO
X-Message-ID-Hash: WZEFDXIXAVDNF5K4DKNREDZQK5VGNSIO
X-Mailman-Approved-At: Mon, 30 Mar 2026 09:26:15 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Haoyu Lu <hechushiguitu666@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: audio: fix error message for BTN_3 button
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WZEFDXIXAVDNF5K4DKNREDZQK5VGNSIO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.374];
	FROM_NEQ_ENVFROM(0.00)[hechushiguitu666@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 6EC4735828A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In gbaudio_init_jack(), when setting SND_JACK_BTN_3 key, the error
message incorrectly says "Failed to set BTN_0". This should be
"Failed to set BTN_3" to match the button being configured.

Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
Reviewed-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 444c53b4e08d..720aa752e17e 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -781,7 +781,7 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 		ret = snd_jack_set_key(module->button.jack.jack, SND_JACK_BTN_3,
 				       KEY_VOLUMEDOWN);
 		if (ret) {
-			dev_err(module->dev, "Failed to set BTN_0\n");
+			dev_err(module->dev, "Failed to set BTN_3\n");
 			goto free_jacks;
 		}
 	}
--
2.17.1
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
