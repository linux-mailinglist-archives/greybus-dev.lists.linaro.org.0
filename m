Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 387C2B055EE
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Jul 2025 11:10:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8806A440EB
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Jul 2025 09:10:56 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	by lists.linaro.org (Postfix) with ESMTPS id CA98544037
	for <greybus-dev@lists.linaro.org>; Tue, 15 Jul 2025 09:10:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=aoEHn50W;
	spf=pass (lists.linaro.org: domain of rmfrfs@gmail.com designates 209.85.128.41 as permitted sender) smtp.mailfrom=rmfrfs@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45629702e52so1338865e9.2
        for <greybus-dev@lists.linaro.org>; Tue, 15 Jul 2025 02:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752570653; x=1753175453; darn=lists.linaro.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1h5Pc6jSMg8b1cL/wTGNUWLlJ8UBTATqjvEdBDjUk0=;
        b=aoEHn50WSLDg3VnqW69jxkAbUBiWgLrYzXK1UFtBTi51cJoIN4CAWHtsrfySId9STt
         9IvPdWUHxFASGYOL8BFrAXRCDKAqpAxk8YmiL3T7KSbLQU4niefT4UGW7wlZR9BIrvcK
         ZaC/YGXFFw05YkpZeoui2dvhuBJ/fe2eIc4jFrH2uxD4r5Qe/D2yd1RqZ5Qwd9WmRrF5
         Riw1JAzaCpLjrNFBgMBk7R//LQbNtWGnYJEOz0cjYO3XQJosewkH08PmTbnPKUHu1ICT
         RQbKvypb4j3pOk+Tkd8UT6MPqXHTiA99C7mYLjUFurFjxwUoKW2PlxSSDGVMuDXmTj8F
         x1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752570653; x=1753175453;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o1h5Pc6jSMg8b1cL/wTGNUWLlJ8UBTATqjvEdBDjUk0=;
        b=I7NDzdPjqrpxzUXeNzDL/gIjZWBZfYwvyLYbe+KX3ZCndkz+hkjadYB01mHDBQgtw3
         lExR6xQsgFfqShAcEgRea/4eGva67N83V0HRqoX53eUMFXjopslJqI/UWkxAcSj913lg
         47uA+QoRWwiR84C7s9tUfbAgjmRfSOLPaJLCmPqmXVYjJAUYwmAG3W0ZMrGjOntgGM8Y
         l/iASjeu/gN5beI2B1kTQ2WpcymRB+tumXUjLf/IQZ1Q4Wq6un3YryksAGmvWC5uy4Ax
         voBN7swqVW9cumDGBBHi3CU9nKYOqSBTiNn51dBhZ8OFh81Kbv/2Js+ucTebbDSYNDjD
         gtBw==
X-Forwarded-Encrypted: i=1; AJvYcCW9qzk/dCDwqzM1nHzSLGpLN8pc+iN9+PkSQ4QmCN+I6akkQAMfLuuuqsvvlCAvbodwjKpC+YOu1Br6sw==@lists.linaro.org
X-Gm-Message-State: AOJu0YyHZDNe5T63Pyt61BmpyYmAYTa+jkLx6JaKCkfxAhpKZAQtzxne
	1pVPIcJ43h2Sam3XJYhENkD+oc72FVAdBxYtW5ixYjgM3IsI8IqPEpFB
X-Gm-Gg: ASbGncuF/YxC/4LBHnsPWMGuw/7tiSPR8jxAGQi8TMVActsdosKiC7DNyNwi5um9t5e
	7KUvpxldrAR34TXV1dbq7iRXr9NqfJZZ5QbIxGt9P8CIAUtlKDf+QGWoULrc4uivV6NDgj5k/pB
	j1q2KLQ9E50WMW+XNgYj1ARPWSlj96sRO4FRgNratvQkIR0ejNsmk9pSTF38o7lhJ65Qfbwk2zA
	NUFEZKre49N9iyC8rqiTAeRSH81LEAzDZuSKZ8F30nGXSJQ37CbO9NJK/JWkZVx5OFllsYUWdI/
	jelbZVnFnCyg5Ugzg3EiENTg/8y3rgoT/WUgqocnlNVWLCcpV3fQXUHqQVlOcCBiCizforkFmQM
	MxQi7PCgcgnv4g+5EkDNduMKSi8FnLGsx7niWyiFqTMrM8qlPwg==
X-Google-Smtp-Source: AGHT+IG8LxAVomRTxHB3htRD5s0m3l9g2VSOjPHXCnIu+z0xdDALWIcnXTdVY9yN2PnTDlOwgoRERg==
X-Received: by 2002:a05:600c:3589:b0:456:1c4a:82b2 with SMTP id 5b1f17b1804b1-4561c4a856amr67890905e9.10.1752570652494;
        Tue, 15 Jul 2025 02:10:52 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454dd538b63sm156999395e9.19.2025.07.15.02.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 02:10:52 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Mime-Version: 1.0
Date: Tue, 15 Jul 2025 10:10:51 +0100
Message-Id: <DBCIG2AHAZHR.31GUITYRTUZXJ@linaro.com>
To: "Greg KH" <gregkh@linuxfoundation.org>, "Rui Miguel Silva"
 <rmfrfs@gmail.com>
References: <20250714135606.41671-1-akhilvarkey@disroot.org>
 <DBBXCAEMM5ZO.GTKVMMR2XDJ7@linaro.com> <2025071540-sepia-amuck-c757@gregkh>
In-Reply-To: <2025071540-sepia-amuck-c757@gregkh>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: CA98544037
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:email,linaro.com:mid,disroot.org:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[209.85.128.41:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.41:from];
	DWL_DNSWL_NONE(0.00)[gmail.com:dkim]
X-Rspamd-Action: no action
Message-ID-Hash: H6WITARXOJRGVN5WHIWKNUVAZKGLYCYG
X-Message-ID-Hash: H6WITARXOJRGVN5WHIWKNUVAZKGLYCYG
X-MailFrom: rmfrfs@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Akhil Varkey <akhilvarkey@disroot.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, johan@kernel.org, elder@kernel.org, ~lkcamp/patches@lists.sr.ht, koike@igalia.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: power_supply fix alignment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/H6WITARXOJRGVN5WHIWKNUVAZKGLYCYG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Greg,
On Tue Jul 15, 2025 at 9:05 AM WEST, Greg KH wrote:

> On Mon, Jul 14, 2025 at 05:38:31PM +0100, Rui Miguel Silva wrote:
>> Hey Akhil,
>> Thanks for your patch.
>> 
>> All looks good with the exception of a small nit...
>> 
>> On Mon Jul 14, 2025 at 2:56 PM WEST, Akhil Varkey wrote:
>> 
>> > Fix checkpatch check "CHECK:Alignment should match open parenthesis"
>> >
>> > Signed-off-by: Akhil Varkey <akhilvarkey@disroot.org>
>> > ---
>> >
>> > Hello, This is my first patch, I appreciate any feedbacks. Thanks!!
>> 
>> Welcome, and continue...
>> 
>> > ---
>> >  drivers/staging/greybus/power_supply.c | 14 +++++++-------
>> >  1 file changed, 7 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/greybus/power_supply.c
>> > index 2ef46822f676..a484c0ca058d 100644
>> > --- a/drivers/staging/greybus/power_supply.c
>> > +++ b/drivers/staging/greybus/power_supply.c
>> > @@ -324,7 +324,7 @@ static struct gb_power_supply_prop *get_psy_prop(struct gb_power_supply *gbpsy,
>> >  }
>> >  
>> >  static int is_psy_prop_writeable(struct gb_power_supply *gbpsy,
>> > -				     enum power_supply_property psp)
>> > +				 enum power_supply_property psp)
>> >  {
>> >  	struct gb_power_supply_prop *prop;
>> >  
>> > @@ -493,7 +493,7 @@ static int gb_power_supply_description_get(struct gb_power_supply *gbpsy)
>> >  	if (!gbpsy->model_name)
>> >  		return -ENOMEM;
>> >  	gbpsy->serial_number = kstrndup(resp.serial_number, PROP_MAX,
>> > -				       GFP_KERNEL);
>> > +					GFP_KERNEL);
>> >  	if (!gbpsy->serial_number)
>> >  		return -ENOMEM;
>> >  
>> > @@ -546,7 +546,7 @@ static int gb_power_supply_prop_descriptors_get(struct gb_power_supply *gbpsy)
>> >  	}
>> >  
>> >  	gbpsy->props = kcalloc(gbpsy->properties_count, sizeof(*gbpsy->props),
>> > -			      GFP_KERNEL);
>> > +			       GFP_KERNEL);
>> >  	if (!gbpsy->props) {
>> >  		ret = -ENOMEM;
>> >  		goto out_put_operation;
>> > @@ -634,8 +634,8 @@ static int __gb_power_supply_property_get(struct gb_power_supply *gbpsy,
>> >  }
>> >  
>> >  static int __gb_power_supply_property_strval_get(struct gb_power_supply *gbpsy,
>> > -						enum power_supply_property psp,
>> > -						union power_supply_propval *val)
>> > +						 enum power_supply_property psp,
>> > +						 union power_supply_propval *val)
>> 
>> Here you fix the alignment, but the last line goes over column 81, even
>> though 80 is not really one hard requirement anymore, all code
>> (strings is ok to go over to be easier to grep for messages) is on that
>> register.
>> 
>> So, to be coherent, if you could please send a V2 without this specific change
>> would be great, Or even better, if you could get rid of all the _ and __
>> prefixes in functions names that would be great, and will give more
>> space for function paramethers.
>> Your call.
>
> Nah, this is fine as-is, we can go over the limit to 100 for tiny stuff
> like this.
>
> And the __ prefixes should be there to show no locking, or "internal"
> functions, right?  So changing the name needs to happen very carefully.

Yup, we can go either way here. I do not have strong feelings about
this.

So, LGTM, Thanks Akhil.
Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

>
> thanks,
>
> greg k-h



_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
