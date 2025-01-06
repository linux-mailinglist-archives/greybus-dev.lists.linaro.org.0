Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 82568A0222B
	for <lists+greybus-dev@lfdr.de>; Mon,  6 Jan 2025 10:51:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 47A3B43D1E
	for <lists+greybus-dev@lfdr.de>; Mon,  6 Jan 2025 09:51:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	by lists.linaro.org (Postfix) with ESMTPS id C1D9F4107C
	for <greybus-dev@lists.linaro.org>; Mon,  6 Jan 2025 09:51:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=qTctbCql;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.53 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361f664af5so161488905e9.1
        for <greybus-dev@lists.linaro.org>; Mon, 06 Jan 2025 01:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736157068; x=1736761868; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+1YcNhTzB+NJ0AXGpO3lzvdJFWAfHpdWAfxwOWgEsxU=;
        b=qTctbCqlGZQRVQfl/EegPSW+fpg5pGZkAyQpgMpBQgrNVlkfmqM6mrxJb+tXJCXaEA
         e1cbpzS3jh1sXAlhBLw6lY4gd3zFAldtOk68oHiza3i94VY96t1UYrLhFHckJDV7d5SV
         t10Lh4hNMCETyPiEi2HXvT8bsafRDdEYPC0Ox7XfZVvjeE26QZdKFYFllp2RihE4XOVW
         /2ig9CjOiHFzdCwfyT1xpy43Y6d46dwklH3MwsOwbdyH2oYZo4p5TfexcSuiLBGCzlqh
         9xTbHejSoFVGW8SqlNDhgCvFYYd16ZclhmiINrAacHYVIPtG6f3kPuX69xR+fs07MJ1m
         fghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736157068; x=1736761868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1YcNhTzB+NJ0AXGpO3lzvdJFWAfHpdWAfxwOWgEsxU=;
        b=T7AA1lTBeePreH77rqDg6vV1tMzl41uKhrwjmHEYpTP8yNe0JRvnNbI67EZG/bZ96e
         XCrHxNFXCp8b2TE4bDel4zdEsFvoDgNR287hVSmcTjc61vjL2DZ/K7XnKxysGf2zIuz3
         Ga0Zcd/FRu2l9KimdY8dISkCSgG1JZD+oORcDURNkNznQUWoIGT67ftq3qbYI7YDDkUk
         IDqywQFxdv62QCZhLmOkaDmpyiHulTp33QNtJHszLytwRW++9Xgn4+btGUKmCkn/+ViE
         4zcwle8EyWOaLqln59CUg1SAcJotNdzUaKxTIr59JjO3U0sMpOE8jltwrlt1+XVKq3LF
         ynXw==
X-Forwarded-Encrypted: i=1; AJvYcCVMYwrXLAhv7vyRGydm6NtVCllgIERYysjvdofGVzDxnAJsVwBUJJLDz9h1irbZRmscdaM2Hz//I6o8kQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yzkj8nDgQdYiT2eQGDP+dm/x/cjWr7CRq9uP3wfDmKo2L3KNrQb
	uqaQXBRRsvuSMbBMz7Tnr6mX1A20gs5S4vkG2kLCOCsyx9J4Ka+FbSmCyQctS3e6Fw==
X-Gm-Gg: ASbGncu3OyCrNY5PayOHBCvXcQ+QrPchDmSM3dVij9cy8iUM/1scFiDADDv6Nfd2F3B
	IdrC9IpxiKoUfRg++znd07E/ydYxB8zt8mFwGdw+jLxlwrgvAd27rXey51Ss8YfuqlrZCH26hau
	K9a1WlyFbnLWJaxSScF+7PO7En/dihvk48UiVqP7tGzUW9e/FuIYv21eZS90CViyEuGOt6NLpaj
	4b54WnbH0tvK8a+ZTbQGoQZ8mxyE7SIOpYqX9mP4DFob0WMBRkLqOOkwmmPBQ==
X-Google-Smtp-Source: AGHT+IHmXleKLa3N60gIDy5ub0LsWvE9b4koj2geI54RUXBm2V6RO5ggQ0ZKvSFfdiPyiXyWjCzTww==
X-Received: by 2002:a7b:cb14:0:b0:436:90d4:5f3e with SMTP id 5b1f17b1804b1-43690d46037mr311062535e9.6.1736157067794;
        Mon, 06 Jan 2025 01:51:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2f9sm48633973f8f.81.2025.01.06.01.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:51:07 -0800 (PST)
Date: Mon, 6 Jan 2025 12:51:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Atharva Tiwari <evepolonium@gmail.com>
Message-ID: <dbdf3497-4359-4b63-b718-f53bf9ad7fc6@stanley.mountain>
References: <2024122358-vexingly-broadly-7df7@gregkh>
 <20241224051917.1971-1-evepolonium@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241224051917.1971-1-evepolonium@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C1D9F4107C
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.28 / 15.00];
	BAYES_HAM(-2.78)[99.06%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,lists.linaro.org,vger.kernel.org,lists.linux.dev,animalcreek.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.53:from];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[209.85.128.53:from]
Message-ID-Hash: NU5IVG6DJGTJFY6CWAKJHOOX6TF72SI4
X-Message-ID-Hash: NU5IVG6DJGTJFY6CWAKJHOOX6TF72SI4
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, johan@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Remove Module from list before freeing in gb_audio_module_release
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NU5IVG6DJGTJFY6CWAKJHOOX6TF72SI4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 24, 2024 at 10:49:17AM +0530, Atharva Tiwari wrote:
> Yes I have tested the patch with greybus drivers enabled on Debian 12.It works as expected, and i did not get any errors or warning during the compilation
> 
> Please let me know if further changes are required.
> 

You're trying to ensure that the list is initialized but instead of testing
for that, the correct way is to initialize it earlier in the process.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
