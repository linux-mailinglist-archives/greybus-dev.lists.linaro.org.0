Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 609E37F662F
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:27:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6729840B58
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:27:06 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	by lists.linaro.org (Postfix) with ESMTPS id 907D23F5C2
	for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 10:39:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=nK5lKWi6;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.214.176 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c9a1762b43so19025165ad.1
        for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 03:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697971175; x=1698575975; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gO2PwCgF6TrXzVHmmodaWvzoIahOuJS1U51meYcBm48=;
        b=nK5lKWi6H96TIM2LF6hsa7aBIyArVm1CNiO5E4m4fTAfaSwnNaZSgUrUXmQq2n+UAI
         SXPI5OqeAja709YWLnSQX3MJiQkEvoE9EVWEFvTiuggHo7T6NmV1Y66RRqv/KxI4CG8h
         4J5s9EZ97700OMvgqgw7t1yW8rmp2L0sO0lpj1UM+lodyLlakAD9Sy82RzP552HdVXjQ
         Vn7n5GIQYAVtfS/wqJ6DTGPXfzQ7Sn59+hgklv68XNYIHv3PISE4WdlEBjYRngZA3qQh
         sUxbnP19mOZ3taJZW9DIecb6FMOeehN+4tnG7sFVK9T0geCPRaWHy1Oiu+wN4wnbwnHq
         fv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697971175; x=1698575975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gO2PwCgF6TrXzVHmmodaWvzoIahOuJS1U51meYcBm48=;
        b=N6Qh8B3MH9xjuaIaEuljM5ISWLF+eGmdUWQ4BFRQ43fgI8dkIp86gNA/XAXJI2IzX1
         u+tmk30BV/FfTL7zXASA4PnzEiAAJJLqzcRQm2bzpjhBoJQqhINmaF5OvIT0PUgRIPag
         +zUqahuk4w2yAAmKeS40jROAArKADFt/IAAXGDxoKvCX4g1gGQOmH1JjJ6UEFQf/r3Bz
         612Kzj87J+o3gX3JCWHWFEOEHQnqy39RoH04dJnq3E3DN8U9RseS7SVS0ziaZng7PiO+
         7u50b/edWc3goQvYWeG7u8YwlZH21+fOG1FFT9X7MxAPKY43bydcaxqLduLiYDRC/O6a
         aehg==
X-Gm-Message-State: AOJu0YwerxuTR7bpC7fboY8UUiGzTvK9KUjiJqgDQQRQKgpG69delC7S
	UVKAJylBQKtcLehM9KRYLwfgBeHwRKRopw==
X-Google-Smtp-Source: AGHT+IHupRxsxOf8XzGoXWmB8r0Ah50M32C5qqbdbbyGsvgkbv7FasfOKxiUO+T3TZZkMU49GZ1eTg==
X-Received: by 2002:a17:902:d34b:b0:1ca:7ec3:f4f9 with SMTP id l11-20020a170902d34b00b001ca7ec3f4f9mr8001564plk.32.1697971174684;
        Sun, 22 Oct 2023 03:39:34 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902ce8b00b001c5076ae6absm4269087plg.126.2023.10.22.03.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 03:39:34 -0700 (PDT)
Date: Sun, 22 Oct 2023 03:39:28 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <827f8417afa3943e8b71910a7ba88ea35614dd2c.1697969950.git.nandhakumar.singaram@gmail.com>
References: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 907D23F5C2
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.176:from];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-MailFrom: nandhakumar.singaram@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: WXSU26QM26BSX6CQW7GTET65HD7CH3QL
X-Message-ID-Hash: WXSU26QM26BSX6CQW7GTET65HD7CH3QL
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:29 +0000
CC: kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/3] staging: greybus: Modify lines end with a '('
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WXSU26QM26BSX6CQW7GTET65HD7CH3QL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adhere to linux coding style. Reported by checkpatch.pl:
CHECK: Lines should not end with a '('

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/greybus/camera.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index ae49e37a87e9..feddceddffbb 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
  * Validate the stream configuration response verifying padding is correctly
  * set and the returned number of streams is supported
  */
-static const int gb_camera_configure_streams_validate_response(
-		struct gb_camera *gcam,
+static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
 		struct gb_camera_configure_streams_response *resp,
 		unsigned int nstreams)
 {
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
