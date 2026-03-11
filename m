Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOROJJCysGkHmQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 01:08:48 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0763925980D
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 01:08:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CB6184014E
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 00:08:46 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	by lists.linaro.org (Postfix) with ESMTPS id B263640149
	for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2026 00:04:28 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=as6Opt6L;
	spf=pass (lists.linaro.org: domain of dlechner@baylibre.com designates 209.85.167.175 as permitted sender) smtp.mailfrom=dlechner@baylibre.com;
	dmarc=none
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-46704fbf62dso1679520b6e.1
        for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 17:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773187468; x=1773792268; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyycAT2xnAdXjbETtQQr3m+mbib4kFnv3znRqdNWGp8=;
        b=as6Opt6LafGnk169rvms0BI6a33AFNPZM9eDi0W3TL/4wzRepdP25yqgMBywXR+bq1
         vH2dD7pkOvv2Wgp7lihpilcaw0S2Ghuqd5PD3qgsH5U3q9u/WDQi+pmtywCZY321Irg8
         g76E9o6jUoJePnBn+OKl/FC8zMjQOaRMV8qKt8lpO+CfAO5avOHigZ3s3jHWY6Z+aess
         speclm3hJ5nJkSj+sCDCaU+X1PrfgAwNS5G1uCQ/bmBl3ZEabwcS9sXt3y6loxxrHO2J
         NTFMO9797fk4wZGQ4YAefT6JeLmX5y7wo8iXpNbO6JfKtqVL+TjJzDaNjsbyA9b//GkE
         ACaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773187468; x=1773792268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyycAT2xnAdXjbETtQQr3m+mbib4kFnv3znRqdNWGp8=;
        b=wFzmo/tc+Qyj/l57JlZ+B1LHxdx//ST7U40EPXCkjLCe4x1ORvNShiyTgi9N/dW0QN
         PhmjD7dDx6a0A+lFDJV18roI1hVKIIsns3XNbiGDCSAtPCVRG8O1oqHWyYhivXYJITZ9
         4RSjCYih/l/xmDWHtvksy/B9hi9NZKiRD99cj7pqF81uuUC5ykBmty7CXjRgi5oUM5zW
         Z4Dpqv/Xkb7lCO11ZSx/S3pVzdAuYtWcRtvd7p+vOJkm8Xw1m7b1J7CC0VcBgATn5NoO
         Z2I+zdzTU51I62coT8EbUfJHAwrDVkKjLJClxkI4gMdLdWHQ60Qi/jrG5my7qVApKc3E
         /F/w==
X-Forwarded-Encrypted: i=1; AJvYcCXtgQePmUQgcdecSx3rGJc/wS+eYFwK/NwL6SCn1hhYMlMcyVq17p3sH9vMZ80QPyly/2kkESr6EUmoAA==@lists.linaro.org
X-Gm-Message-State: AOJu0YzLzWzK0h95t95eAUJ40hn8xX3HLNPRSKb9S+XoWKkv3Lq8ZW5M
	j8vx4f5/vnsxXvbrF0VnTQ5fTwDRX1DiiFgBnxxOzLCu4ajtQDS7+gcsGE2eyQ6pEl0=
X-Gm-Gg: ATEYQzwYzEmHNEclVmXs324ryL1SSqLjZjKqvwVJ7my4Dvq3NxMQQHTVwC+nmdZRb+w
	Jd+RGY8YLQDxqiKBy9JG3uhkmqig03R3yWM0oldZwW6l2z1Q/80oI9MzedBO0giEC6xZ3AYhD1u
	yKMs6dk5V2WdQb8EVZUJWdZd6O6I7yQRR8ha2Pe0aPOGah+a35bJ3m1rEuS+kyEaMMVu88WjbYL
	QikvIFJfBftkvR351/OAq1dt+ITuursXI9zRJSo//4UArlNCtztNkdRK/WYK1siYtxh4R105QGP
	CDZon5CTSs9FP01TTk+rFh2PjxuDPYToSFDfP2k6U1uMEy//pnZV6473ESgNZOSiKdCzkUUrx4g
	H91TWeZ6TnbugqT60gf8R7ng//Qx2Bw3ncYOh0goC6Rpzkug+6agQSB1XutiP58Xp9KsIC8ksjk
	9bt3JOp1eRja66HPaEih8zgyVOhaKvW3evJ0SvZ9V1/wfsqr3hJ3tom7KgKkSoBsdskx5BZ46cf
	g==
X-Received: by 2002:a05:6808:14c8:b0:450:b249:718c with SMTP id 5614622812f47-46733547c85mr330873b6e.31.1773187468063;
        Tue, 10 Mar 2026 17:04:28 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:82ac:f3fe:2e5f:ec03? ([2600:8803:e7e4:500:82ac:f3fe:2e5f:ec03])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46734160cebsm233690b6e.7.2026.03.10.17.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 17:04:26 -0700 (PDT)
Message-ID: <04ffc988-f4ce-47f8-a998-66d2553d88af@baylibre.com>
Date: Tue, 10 Mar 2026 19:04:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
 m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, pure.logic@nexus-software.ie
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-4-sanjayembedded@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260310200513.2162018-4-sanjayembedded@gmail.com>
X-Spamd-Bar: ---
X-MailFrom: dlechner@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: RKRGSRYXBAUD4PB462LBZ36FXXMJGFRM
X-Message-ID-Hash: RKRGSRYXBAUD4PB462LBZ36FXXMJGFRM
X-Mailman-Approved-At: Wed, 11 Mar 2026 00:08:45 +0000
CC: nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, skhan@linuxfoundation.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/7] iio: st_sensors: simplify cleanup using __free
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RKRGSRYXBAUD4PB462LBZ36FXXMJGFRM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0763925980D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,mediatek.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:-];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.388];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,baylibre.com:mid,lists.linaro.org:rdns,lists.linaro.org:helo]
X-Rspamd-Action: no action

On 3/10/26 3:05 PM, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
> 
> No functional change intended for kmalloc().
> 
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
>  drivers/iio/common/st_sensors/st_sensors_core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/common/st_sensors/st_sensors_core.c b/drivers/iio/common/st_sensors/st_sensors_core.c
> index dac593be5695..f641b62e692b 100644
> --- a/drivers/iio/common/st_sensors/st_sensors_core.c
> +++ b/drivers/iio/common/st_sensors/st_sensors_core.c
> @@ -501,14 +501,14 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
>  
>  	byte_for_channel = DIV_ROUND_UP(ch->scan_type.realbits +
>  					ch->scan_type.shift, 8);
> -	outdata = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
> +	u8 *outdata __free(kfree) = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);

Even better would be to not alloc new memory at all.

We could probably reuse buffer_data from struct st_sensor_data for this.

>  	if (!outdata)
>  		return -ENOMEM;
>  
>  	err = regmap_bulk_read(sdata->regmap, ch->address,
>  			       outdata, byte_for_channel);
>  	if (err < 0)
> -		goto st_sensors_free_memory;
> +		return err;
>  
>  	if (byte_for_channel == 1)
>  		*data = (s8)*outdata;
> @@ -517,9 +517,6 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
>  	else if (byte_for_channel == 3)
>  		*data = (s32)sign_extend32(get_unaligned_le24(outdata), 23);
>  
> -st_sensors_free_memory:
> -	kfree(outdata);
> -
>  	return err;

Should be able to change this to `return 0;` now.

>  }
>  

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
