Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 320DDC696D2
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:39:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 487523F943
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:39:05 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	by lists.linaro.org (Postfix) with ESMTPS id 0B26E3F820
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 18:20:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=PQyJTO7X;
	spf=pass (lists.linaro.org: domain of ayaanmirzabaig85@gmail.com designates 209.85.214.180 as permitted sender) smtp.mailfrom=ayaanmirzabaig85@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29808a9a96aso47678575ad.1
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 10:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403607; x=1764008407; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9F75l1r3oOOy7hzlk2PY1Dr+TRiS53YcsjFMUPJpnJ4=;
        b=PQyJTO7XFnNw2W6apjh0Wg8D/qZeNEDBPUsA4tEIg+GZhQOw5zkuwpcbgvVZufxg2s
         2LkBiMarv6p0n5UzwdF9r74Etg0ZUs2GN+WLEVRzhoCJ3PRA94Ge1SyTWlKQsywhCpzC
         Pp2Az1DWGY986SVhanQkTpOmoR7ZKy+VgqdBcEozzQrkGrYmKycYNQKsHBnpVMzfundl
         cniwLK5ziSbGj8k1elILg8NU8iG8fIJiurnfU8ut5+WFTz8eIU29BtIqp+rXwMcybbCa
         Y0QmVQFfqTRwYTU8rv4BMrBpxe1eKxu2YVWmbyvp/HDqMkRH5x3pWqnEljCLbz/8o5GN
         +UVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403607; x=1764008407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9F75l1r3oOOy7hzlk2PY1Dr+TRiS53YcsjFMUPJpnJ4=;
        b=v/7yfpwelkbM2EdYpH0LOvfIHPUvgvKky7jUo/TnX2RlITeYJKP1cEuAhUcEPZLHE1
         d3xnH7gzk8pFH5AzwtCZlsttW3NJTW8LQZDQVXJXuwZS32QlntIDpwpA2G72Nchvm8og
         goiu8fHo4MZJ/Q8mD96g8QgPZBQZhGDxcJzAiJ8a7sM5zhq5uk2fCxPWpT5AM4NFyRSH
         V4Jc1jWKmr0g/9YWaZbC6HbCScbKh4LsLD0H1kVoJ0V8EYuUXC4hne7Yv2DvmwtddTOD
         mjHdphKdztTkCcXKWm5gFl2XcDfu+YKDsYXdTGsyZPSKsoqwGX3lNxJzxIWOrlDii+Qv
         D0kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbjAAImIjgM3mOQWi6FIseHESw0ZqKf+KTnPU7K71l6BfF/50eLO8X+EiI/F8HR4ZFvNdQDWSyBZzJwQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YxuGKL/l7KtdjcwAQXHzHWEFAQm6ghVcE2WH7uOmC/9/x0sHiTP
	QttiFfjXOfO/FkQ90bFh7IeyKcp4ADPpIqzCdcCAP0Q39Gy445uNsSZJ
X-Gm-Gg: ASbGnctOlSdBe2clAp+pwrlfVui4wJLKOMoXd2nCAm+QnI++tk0EKOGp/xAvKd/q+By
	cJAZOkCcKU5wHlkxCYQlz5cUucqhVJYhMjDQCYH3qy6CW6Xcl9g395xzqF7aKkrSq73Dd9B/ffX
	yZuOlMKE8DchuUJq6xsMF3CmG+GHHxWCy4NVpRsfYP1hhMiOUeXF1n95+mOP1SDwiBn8Dbpcl8n
	Kysu2rwa/6NVLdN1WZ8P9fpVFiQoxPrdHaRkmvfFbkEhvQSfHPka6NM7deZkit7+URKJlbacbAz
	eF3TJHpaN5Fc0xv/g+7IpDdvB2sXPGfWLe55w6ANPLuYEvDtMNzNbYDotG7nLLFkTc1WenLOaq5
	LLuVGHG7JU5F9EcIPUec5BsoId//udoz6qARXrkNls2r9sxdrYgTM8+tu8wipXz31sfQJ9q8ld5
	xGtNg/NljQmsQW/POMmgvmyqlXYjbDREto+OQW
X-Google-Smtp-Source: AGHT+IG45lzJLtg0H+Ny1+OT5oV1Sd35S5MOVN+EqIhQLIkJKEPMtV3Z725C1IvuE8ALddQ0zIVFSg==
X-Received: by 2002:a17:902:da4f:b0:295:6d30:e26f with SMTP id d9443c01a7336-2986a6ec220mr170360965ad.22.1763403607168;
        Mon, 17 Nov 2025 10:20:07 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:06 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 23:48:09 +0530
Message-ID: <20251117181818.118139-5-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.180:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,lists.linaro.org,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0B26E3F820
X-Spamd-Bar: --
X-MailFrom: ayaanmirzabaig85@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: Y7QKUODFZMLK4ZVBWL7EQWWZLJJY5JBM
X-Message-ID-Hash: Y7QKUODFZMLK4ZVBWL7EQWWZLJJY5JBM
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:35 +0000
CC: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 04/13] staging: greybus: audio: remove obsolete INPUT_PROP_NO_DUMMY_RELEASE FIXME
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Y7QKUODFZMLK4ZVBWL7EQWWZLJJY5JBM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The commented-out code attempted to set INPUT_PROP_NO_DUMMY_RELEASE
on the jack's input device, but this input property does not exist
in the kernel and struct snd_jack does not expose an input_dev
field. The FIXME is obsolete and the commented code is invalid, remove it.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 2f05e761fb9a..cafce125d5d4 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -785,12 +785,7 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 			goto free_jacks;
 		}
 	}
-
-	/* FIXME
-	 * verify if this is really required
-	set_bit(INPUT_PROP_NO_DUMMY_RELEASE,
-		module->button.jack.jack->input_dev->propbit);
-	*/	
+
 
 	return 0;
 
-- 
2.51.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
